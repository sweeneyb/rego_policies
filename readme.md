A couple of example rego files that apply some policy over kubernetes-related resources.  

## To Run:
1. Grab conftest from https://github.com/open-policy-agent/conftest/releases
1. go into one of the example folders 
1. run ```../conftest test <file>```

For example, in the kubernetes folder, ```../conftest test deployment-fail.yaml```
The output should be something like:

```
[kubernetes]$ ../conftest test deployment-fail.yaml 
WARN - deployment-fail.yaml - main - Found an old/disallowed nginx image"nginx:1.14.1". Please update.

2 tests, 1 passed, 1 warning, 0 failures, 0 exceptions
```