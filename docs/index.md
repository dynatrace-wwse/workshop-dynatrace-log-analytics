# About
--8<-- "snippets/send-bizevent/index.js"

<!--TODO: Remove Under Construction -->
--8<-- "snippets/under-construction.md"

<!--TODO: Update disclaimer (optional) -->
--8<-- "snippets/disclaimer.md"

<!--TODO: Update lab overview (match readme) -->
## Workshop Overview

This workshop is designed to help participants understand how to scale log analytics using Dynatrace, particularly leveraging its Grail-powered Log Management and Analytics capabilities. It’s hands-on and intended for technical users who want to explore log ingestion, querying, and visualization at enterprise scale.

**Lab tasks:**

1. About

    - Understand the purpose of this workshop and what will be accomplished

2. Getting Started

    - Complete prerequisites before starting the workshop

3. Codespaces

    - Deploy Kubernetes cluster with demo applications used during the workshop
    - Deploy Dynatrace configurations (such as workshop notebooks) using Monaco

4. Deploy Dynatrace

    - Deploy Dynatrace on Kubernetes for full-stack observability with logs in context
    - Validate observability signals, including logs

5. Scaling Log Analytics

    - Learn the best practices of scaling log analytics with Dynatrace
    - Reference presentation companion asset

6. Configure Dynatrace

    - Configure Dynatrace using the best practices covered in scaling log analytics

7. DQL Exercises

    - Learn how to use Dynatrace Query Language (DQL) to perform fast and powerful analytics on your observability data, including logs

8. Anomaly Detection

    - Leverage Dynatrace's Davis AI to detect anomalies from log data to identify issues and resolve them faster

9. Dashboards

    - Learn how to visualize observability signals, including logs, using the powerful and easy to use dashboards in Dynatrace

10. Resources

    - Additional resources available to continue your log analytics journey with Dynatrace, after completing the workshop

11. Cleanup

    - Tear down and clean up the workshop assets after its completion

<!--TODO: Update tech spec of lab components -->
## Technical Specification

### Technologies Used
- [Dynatrace](https://www.dynatrace.com/trial){target=_blank}
- [Kubernetes Kind](https://kind.sigs.k8s.io/){target=_blank}
    - tested on Kind tag 0.27.0
- [Dynatrace Operator](https://github.com/Dynatrace/dynatrace-operator){target=_blank}
    - tested on v1.7.0 (September 2025)
- [Dynatrace OneAgent](https://docs.dynatrace.com/docs/whats-new/oneagent){target=_blank}
    - tested on v1.319 (July 2025)

### Reference Architecture
<!--TODO: Updated reference architecture -->

## Continue

In the next section, we'll review the prerequisites for this lab needed before launching our Codespaces instance.

<div class="grid cards" markdown>
- [Continue to getting started:octicons-arrow-right-24:](2-getting-started.md)
</div>