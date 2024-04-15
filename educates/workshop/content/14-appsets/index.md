---
title: Application Sets
---

While we have been working exclusively within our isolated clusters throughout this workshop, in the real world, you often have to deal with **multitudes** of things:

- multitudes of tenants
- multitudes of clusters
- multitudes of Applications

To make handling of those scenarios easier, ArgoCD introduced the `ApplicationSet` at some point. The [official documentation](https://argo-cd.readthedocs.io/en/stable/operator-manual/applicationset/) describes ApplicationSets fittingly as **Application factories** - let's see how they work.

## Inspecting the ApplicationSet CRD

The ArgoCD documentation publishes an example ApplicationSet that looks like this:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: test-hello-world-appset
  namespace: argocd
spec:
  # See docs for available generators and their specs.
  generators:
  - list:
      elements:
      - cluster: https://kubernetes.default.svc
  # Determines whether go templating will be used in the `template` field below.
  goTemplate: false
  # Optional list of go templating options, see https://pkg.go.dev/text/template#Template.Option
  # This is only relevant if `goTemplate` is true
  goTemplateOptions: ["missingkey="]
  # These fields are identical to the Application spec.
  template:
    metadata:
      name: test-hello-world-app
    spec:
      project: my-project
  # This sync policy pertains to the ApplicationSet, not to the Applications it creates.
  syncPolicy:
    # Determines whether the controller will delete Applications when an ApplicationSet is deleted.
    preserveResourcesOnDeletion: false
  # Alpha feature to determine the order in which ApplicationSet applies changes.
  strategy:
  # This field lets you define fields which should be ignored when applying Application resources. This is helpful if you
  # want to use ApplicationSets to create apps, but also want to allow users to modify those apps without having their
  # changes overwritten by the ApplicationSet.
  ignoreApplicationDifferences:
  - jsonPointers:
    - /spec/source/targetRevision
  - name: some-app
    jqPathExpressions:
    - .spec.source.helm.values
```

We can extract a few key characteristics of ApplicationSets here:

- ApplicationSets declare **generators** to provide values
- Those values can then be consumed in the declared **template**
- There are mechanisms in place to allow endusers to **overwrite** some of the **predefined attributes** of the generated Applications
- There is a way to **control** the **deployment order** of generated Applications

The most important part are the available **generators**, so let's have a second look.

## Inspecting Available Generators

We can inspect the available generators via `kubectl`:

```terminal:execute
prefix: Run
title: Display available ApplicationSet Generators
command: |
  kubectl explain applicationset.spec.generators
```

Below is a short summary of their respective purpose:

- `clusterDecisionResource`:
- `clusters`: provides data about the clusters managed by ArgoCD
- `git`: provides data about either directories or files within Git repositories
- `list`: provides hardcoded values as defined in the ApplicationSet
- `matrix`: provides all possible combinations of the values provided by two other generators
- `merge`: merges the values provided by other generators
- `plugin`: provides custom information, depending on implementation
- `pullRequest`: provides information about a pull request on a SCMaaS
- `scmProvider`: provides information about repositories (e.g. within an organization) on an SCMaaS
- `selector`: allows for post-selection of value sets provided by another generator

## Delivering Monitoring to Multiple Teams

For our **last practical example** of this workshop, we are going to simulate the following scenario:

We are cluster operators for a **multi-tenant** cluster, where each tenant gets one (or many) **namespaces** for themselves.

**Monitoring** happens on a per-tenant basis, i.e. **every tenant** gets their own instances of [Prometheus](https://prometheus.io) and [Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/) deployed to one of their namespaces.

To achieve this, we are going to create an ApplicationSet, **combining** two `generators` by using the `matrix` generator:

- `git` generator to **auto-discover applications** to install
- `list` generator to **auto-discover hard-coded teams**

Thus, our ApplicationSet looks like this:

```editor:open-file
prefix: Editor
title: Open gitops-examples/monitoring-applicationset.yaml
file: ~/gitops-examples/monitoring-applicationset.yaml
```

{{< danger >}}
**Allowing fields like `destination.namespace` or `project` to be templated is dangerous!**

Since the ArgoCD `application-controller` will deploy the generated Applications in a privileged way, users may be able to elevate their privileges by making their Applicationsets/Applications deploy to namespaces where they shouldn't be authorized on.

**If fields like `destination.namespace` or `project` are templated, cluster administrators need to thoroughly review pull requests against the GitOps repository!**
{{< /danger>}}

After inspecting this ApplicationSet definition and the referenced manifests in our forks of the `gitops-example` repos, a course of action manifests:

1. Create the referenced AppProject `team-monitoring`.
2. Create fitting source/destination/clusterResource settings for AppProject `team-monitoring`.
3. Adjust all occurences of `repoURL` within the ApplicationSet definition to point to **your fork**.
4. Apply the ApplicationSet to your cluster.
5. Watch the GitOps magic happen.

{{< note >}}
**To be fair - this last assignment is tough, with very few hand rails to follow.**

Try figuring it out on your own, ask for help if problems occur or something remains unclear - figuring stuff out on your own is the most rewarding way to learn, but the trainer(s) are here to help!
{{< /note >}}