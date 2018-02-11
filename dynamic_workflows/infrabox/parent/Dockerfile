FROM alpine

CMD echo '{"version":1, "jobs": [{"name": "dynamic-child", "type": "docker", "build_context": "../..", "build_only": false, "resources": {"limits": {"cpu": 1, "memory": 1024}}, "docker_file": "infrabox/dynamic-child/Dockerfile"}]}' > /infrabox/output/infrabox.json
