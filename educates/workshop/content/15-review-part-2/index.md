---
title: Review Part 2
---

In the second part of this workshop, we looked at two advanced concepts of ArgoCD: the *App-of-Apps* pattern, and the `ApplicationSet` CRD and its controller.

While the former shines at bundling multiple Applications under one umbrella Application, e.g. **for bootstrapping** clusters or environments within clusters, the latter excels in **multitenancy** and/or **multicluster environments** due to its flexibility and possibilities of combinations.

Going forward, just remember: *Apps of Apps* are to ArgoCD what **umbrella charts** are to Helm, and `ApplicationSets` are incredibly versatile **Application factories**.
