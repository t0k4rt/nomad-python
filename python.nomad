job "python_test" {
  datacenters = ["dc1"]
  type = "batch"
  group "python_test" {
    count = 1

    task "python_localhost" {
      driver = "exec"
      logs { }
      vault {
        policies = ["access-deploy-key"]
      }

      template {
        data = <<EOH
          SSH_DEPLOY_KEY="{{with secret "secret/deploy-key"}}{{.Data.data.key}}{{end}}"
        EOH
        destination = "secrets/file.env"
        env         = true
      }

      artifact {
        source = "git::https://github.com/t0k4rt/nomad-python"
        destination = "local/repo"
      }

      config {
        command = "/bin/bash"
        args = ["local/repo/nomad.sh", "main.py"]
      }
    }
  }
}
