import os

ghoutput = os.getenv('GITHUB_OUTPUT')

print(ghoutput)

with open(ghoutput, "a") as fh:
    fh.write("stop_workflow=true")