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
        args = ["-c", "pip3 install -r local/repo/requirements.txt && python3 local/repo/main.py"]
      }
    }
  }
}
