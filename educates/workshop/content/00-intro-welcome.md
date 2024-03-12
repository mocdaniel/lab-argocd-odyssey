---
title: "ArgoCD Odyssey: From Basics to Brilliance"
---

This workshop provides a thorough introduction to [ArgoCD](https://argoproj.github.io/cd),
an open-source GitOps solution for Kubernetes.

The workshop is designed to build on minimal prior knowledge, though
it is recommended to have some familiarity with [Kubernetes](https://kubernetes.io),
[Helm](https://helm.sh), and [Git](https://git-scm.com).

## Navigation

You can navigate the workshop content using the **Continue** button at the
bottom of each page, or by using the **Table of Contents** and **Arrow**
buttons at the top of this window.

## Terminal

In addition to instructions, you are provided with two terminals to
follow along with the workshop.

In the terminal, you have access to many useful tools common to a Kubernetes
environment or useful
for this workshop, e.g.:

- [kubectl](https://kubernetes.io/de/docs/tasks/tools/install-kubectl/)
- [Helm](https://helm.sh)
- [k9s](https://k9scli.io/)
- [git](https://git-scm.com/)

## IDE and Slides

Next to your **terminal**, you find buttons for a **Visual Studio Code**
instance as well as this workshop's accompanying **slides**.
Switch between the different tabs to access the different tools;
state and progress are preserved across the different tabs.

## Action Blocks

Throughout this workshop, there will be different **blocks** of content
you can interact with.
Most action blocks will be **executable**. The signifier
for this feature is the running stick figure.
You can run the contained code by simply **clicking the code block**. This
will execute the code in the terminal on the right.

```terminal:execute
prefix: Run
title: Greet ArgoCD
command: echo "Hello, ArgoCD!"
```

Other blocks will be copyable like the one below.

```workshop:copy-and-edit
prefix: Copy
title: Paste from clipboard
text: |
  kubectl cluster-info
  kubectl get nodes
  kubectl get pods --all-namespaces
```

There might be other kinds of actions, which aren't explained here -
as a rule of thumb, the **title** of the block will signify the expected
action which will happen upon clicking the block.
