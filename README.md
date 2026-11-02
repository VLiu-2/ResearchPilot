# ResearchPilot

ResearchPilot is a traceable multi-agent research workspace. It decomposes an open-ended question into focused search tasks, streams the workflow in real time, and produces a structured report backed by task-level sources.

## Highlights

- **Task-driven research** turns a broad topic into focused, independently traceable queries.
- **Live execution view** streams planning, search, tool calls, summaries and report generation through SSE.
- **Evidence visibility** preserves source details for each task and reports unique-source count and source coverage.
- **Research archives** restore the latest 10 reports together with their tasks and evidence snapshots.
- **Portable reports** export Markdown with evidence metrics for review or further editing.
- **Failure-aware workflow** handles empty evidence, quota notices, invalid task limits and cancelled runs explicitly.

## Architecture

```text
Vue 3 research workspace
          │ SSE
          ▼
FastAPI orchestration layer
          │
          ├── Planning Agent
          ├── Search + source normalization
          ├── Task Summarizer
          └── Report Writer
                    │
                    ▼
        Report + task-level evidence
```

## My engineering work

- Designed persistent research archives with report, task and source snapshots.
- Added unique-source counting and task-level evidence coverage metrics.
- Implemented Markdown export that carries research quality indicators.
- Fixed synchronous workflow execution where generator tasks were previously skipped.
- Added task bounds and defensive handling for empty sources and provider quota responses.
- Standardized the standalone API identity, setup workflow and portfolio documentation.

## Stack

Vue 3 · TypeScript · FastAPI · HelloAgents · Server-Sent Events · DuckDuckGo/Tavily

## Run locally

1. Run `setup.ps1` to install the backend and frontend dependencies.
2. Configure the model and search provider in `backend/.env`.
3. Start the services with `./start.ps1 backend` and `./start.ps1 frontend`.

Environment templates contain placeholders only. Real `.env` files are excluded from Git.

## License

Released under CC BY-NC-SA 4.0. Third-party attribution and modification notes are recorded in `NOTICE.md`.
