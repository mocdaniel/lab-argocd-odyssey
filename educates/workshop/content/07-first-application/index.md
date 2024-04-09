---
title: Creating Our First Application
---

We will create our first application using the **ArgoCD UI** - later on we will see examples of using the **ArgoCD CLI** and its **CRDs**.

## Creating the Application

Click on **New App** in the Applications view and fill in the following details - some of them can be picked from dropdowns in the form.

**Leave all other settings in their default states.**

---

|  |  |
|:--------|-----:|
| **Application Name** | first-gitops-app |
| **Project Name** | default |
| **Repository URL** | https://github.com/\<your-username\>/gitops-examples.git |
| **Path** | first-gitops-app |
| **Cluster URL** | https://kubernetes.default.svc |
| **Namespace** | first-gitops-app |

---

Once we configured our `Application`, we can confirm by clicking **Create** in
the top.

The application will appear in ArgoCD's **Applications view**:

![Unsynced demo application in ArgoCD UI](demo-application.png)

It indicates clearly that it is **out of sync** (obviously, since we never
synced before) and thus resources defined in Git are **missing**.

## Syncing the Application

Sync the application by clicking on **Sync**. After a short moment, the UI
will update - **the sync failed!😱**.

![Application in ArgoCD UI - sync failed](failed-demo-application.png)

## Investigating the Error

1. Navigate to the **Application Details view** by
clicking the Application tile.
2. Click on **Sync failed** to display details of the last sync attempt
3. Find the culprit - **we tried to deploy to a non-existing namespace!**

![Details of a failed sync attempt in ArgoCD UI](failed-sync-details.png)

## Syncing with Sync Options

This is not a problem though - ArgoCD can create namespaces for us on demand:

1. From the `Application`'s detail page, click on **Sync**
2. Tick the box **Auto-create Namespace**
3. Confirm by clicking on **Synchronize**

After a few seconds, all resources should display a green tick - we successfully deployed our first application! 🥳
