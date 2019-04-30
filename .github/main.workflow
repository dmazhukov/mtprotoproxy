workflow "Build and push to GCR" {
  on = "push"
  resolves = ["Filters for GitHub Actions"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["GITHUB_TOKEN"]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  needs = ["GitHub Action for Docker"]
}
