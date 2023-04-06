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


## Running outside of conftest
From the root dir:
```
docker run -it -v `pwd`/rbac:/policy openpolicyagent/opa eval -i /policy/fail.json --data /policy/rbac.rego --format=pretty  'data.rbac.allow'
```

This returns ```false```

This is from the (stale doc) example: https://www.openpolicyagent.org/docs/v0.11.0/how-do-i-test-policies/

```
docker run -it -v `pwd`/rbac:/policy openpolicyagent/opa eval -i /policy/pass.json --data /policy/rbac.rego --format=pretty  'data.rbac.allow'
```
Evaluates to true