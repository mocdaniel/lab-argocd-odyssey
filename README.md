# ArgoCD Workshop

This workshop aims at providing an overall introduction to [ArgoCD](https://argo-cd.readthedocs.io).
It goes over various concepts like `Applications`, `AppProjects`, and `ApplicationSets`,
ArgoCD's architecture, and how you would use it for your day-to-day GitOps needs.

Check the instructions below to deploy the workshop locally.

## Deploying the Workshop Locally

This workshop has been developed using [educates](https://educates.dev),
a workshop platform by VMWare Tanzu.
It is open source and can run on top of a production Kubernetes cluster
or a local container runtime.

### Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop/)
- [KinD](https://kind.sigs.k8s.io/#installation-and-usage)
- [educates CLI](https://github.com/vmware-tanzu-labs/educates-training-platform/releases/latest)

Follow the linked documentation to install the respective versions for your OS.

### Bootstrapping Educates

Once all prerequisites have been installed, create a new KinD cluster using

```console
educates create-cluster
```

Depending on your network, this will take 5-15 minutes to download and install
the educates platform on top of a new KinD cluster.

### Deploying the Workshop

When the educates platform has been created successfully, deploy the workshop
from the release artifacts on GitHub:

```console
educates deploy-workshop -f https://github.com/mocdaniel/lab-argocd-odyssey/releases/download/1.0.0/workshop.yaml
```

### Starting the Workshop

Once the workshop has been deployed, you can open the platform in your browser using

```console
educates browse-workshops
```

and start the workshop from there.

## Hot Reload During Development

When developing the workshop, you might want to hot-reload workshop
contents for faster feedback-loops. This is possible with Educates
in a local environment, using the following commands:

```console
# publish the local workshop
cd educates
educates publish-workshop

# serve the workshop, with contents coming from your local directory
educates serve-workshop --patch-workshop
```

You can now work on the contents in `educates/workshop/content` and they
will update in the workshop portal in real-time.
