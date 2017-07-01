## Google Cloud SDK

**Maintainer:** [@hamishmorgan](https://github.com/hamishmorgan)

[Google Cloud SDK](https://cloud.google.com/sdk/) is a set of tools for Cloud Platform. 
It contains `gcloud`, `gsutil`, and `bq`, 
which you can use to access Google Compute Engine, Google Cloud Storage, Google BigQuery, 
and other products and services from the command-line. You can run these tools 
interactively or in your automated scripts.

This plugin locates Google Cloud SDK root directory, adds it to the `PATH`, and enables 
completion for `gcloud`, `gsutil` and `bq` commands. Completion is provided by the SDK
so this plugin only finds and sources the relevant files.


### Installation

To enable, add `gcloud` to the plugins definitions in your `~/.zshrc` file:

```
plugins+=( gcloud )
```
