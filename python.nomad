job "python_test" {
  datacenters = ["dc1"]
  type = "batch"
  group "python_test" {
    count = 1

    task "python" {
      driver = "exec"
      logs { }

      artifact {
        source = "git::https://github.com/t0k4rt/nomad-python"
        destination = "local/repo"
      }

      config {
        command = "/bin/bash"
        args = ["local/repo/nomad.sh", "main.py",  "--consul_host node-0.node.consul"]
      }
    }

    task "python_localhost" {
      driver = "exec"
      logs { }

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
