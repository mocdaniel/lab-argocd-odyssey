---
title: Summary
---

We covered *a lot* over the course of the last two to three hours - and it's unlikely you'll remind everything from this workshop in the future.

That's why the workshop, including the hosting environment, is [publicly available on GitHub](https://github.com/mocdaniel/lab-argocd-odyssey) for you to review and redo.

In addition, there's of course a lot of things we haven't touched upon, so what follows is a collection of links to both, the official documentation sections as well as reading material revolving around a few other, advanced topics:

### Secret management with ArgoCD

Because we don't want (and shouldn't) upload our precious passwords to GitHub for everyone to see.

- [**Official docs**](https://argo-cd.readthedocs.io/en/stable/operator-manual/secret-management/): a lot of projects revolving around secret management for GitOps are linked there.
- [**How to manage Kubernetes secrets with GitOps**](https://akuity.io/blog/how-to-manage-kubernetes-secrets-gitops/): A blog post looking at and comparing many of the projects mentioned by the official docs.

### How to scale and/or federate ArgoCD

- [**Official docs**](https://argo-cd.readthedocs.io/en/stable/operator-manual/high_availability/): Running ArgoCD in High Availability mode
- [**Official docs**](https://argo-cd.readthedocs.io/en/stable/proposals/004-scalability-benchmarking/): ArgoCD Scalability Benchmarks
- [**A comprehensive overview of ArgoCD architectures**](https://codefresh.io/blog/a-comprehensive-overview-of-argo-cd-architectures-2024/): A blog post by Codefresh about possible (federated) ArgoCD setups

### Securing ArgoCD

- [**Official docs**](https://argo-cd.readthedocs.io/en/stable/operator-manual/applicationset/Security/): The already mentioned security implications of `ApplicationSets`
- [**Official docs**](https://argo-cd.readthedocs.io/en/stable/operator-manual/security/): Everything revolving around Security in ArgoCD
- [**CNCF report**](https://www.cncf.io/blog/2023/04/21/argo-cd-end-user-threat-model-security-considerations-for-hardening-declarative-gitops-cd-on-kubernetes/): Argo CD end user threat model: security considerations for hardening declarative GitOps CD on Kubernetes
