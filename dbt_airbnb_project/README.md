# Airbnb Analytics Pipeline and Course Project

Este repositório contém o pipeline completo de ingestão, transformação e entrega de dados do dataset Airbnb, utilizando **dbt**, **Mage** (rodado via Docker Compose), **BigQuery** e **GitHub Actions**\*\*.

## 📁 Estrutura do Projeto

```
├── analyses/            # Explorações ad-hoc de SQL
├── macros/              # Macros reutilizáveis (e documentação em macros/docs)
├── models/
│   ├── staging/         # Modelos raw: limpeza, cast e rename
│   ├── dimensions/      # Modelos intermediate: deduplicações (dim_hosts), pivots
│   ├── trusted/         # Consolidação de entidades: joins business logic
│   └── delivery/        # Marts: tabelas finalizadas para dashboards Metabase
├── snapshots/           # Snapshots de alterações históricas
├── seeds/               # Dados estáticos (ex.: calendário para séries temporais)
├── tests/               # SQL tests personalizados
├── macros/docs/         # Documentação das macros em Markdown
├── profiles.yml         # Credenciais de conexão (não versionar!)
├── dbt_project.yml      # Configurações do projeto dbt
├── README.md            # Este documento
└── .github/workflows/   # Configuração de CI/CD (build, tests, docs)
```

## 🚀 Como começar

1. Clone o repositório e instale dependências:

   ```bash
   git clone <repo_url>
   cd dbt_airbnb_project
   python -m venv venv && source venv/bin/activate
   pip install dbt-bigquery pre-commit
   pre-commit install
   ```

1.1. Instale e rode o Mage via Docker Compose:

```bash
docker-compose up -d
```

````

2. Configure seu perfil de conexão em `profiles_local.yml` (usar service account do GCP):
```yaml
dbt_airbnb_project:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: service-account
      project: mage-airbnb-pipeline
      dataset: raw_airbnb
      threads: 4
      keyfile: /path/to/credentials.json
````

3. Execute o pipeline completo:

   ```bash
   dbt debug
   dbt run
   dbt test
   ```

4. Gere e visualize a documentação:

   ```bash
   dbt docs generate
   dbt docs serve --port 8001
   ```

5. Crie o **delivery layer** para Metabase:

   ```bash
   dbt run --models delivery+
   dbt test --models delivery+
   ```

## 📖 Convenções de Código

* **Nomes de modelos**:

  * `stg_*` para staging
  * `dim_*` para dimensions
  * `trusted_*` para trusted/business logic
  * `mart_*` ou `delivery_*` para marts
* **SQL Style**:

  * Vírgula à esquerda
  * Cast explícito de tipos
  * Nomes em `snake_case`
* **YAML**:

  * Documentar cada modelo e coluna com `description:`
  * Incluir `tests: [not_null, unique, accepted_values]` quando aplicável
  * Definir `exposures:` para dashboards e apps que consomem os dados

## 📚 Documentação Adicional

* **Exposures**: `models/exposures/exposures.yml` registra dashboards e aplicações.
* **Metrics**: `models/metrics/metrics.yml` contém métricas nativas do dbt.
* **Macros**: veja `macros/docs/` para instruções de uso de cada macro.

## 🔄 CI/CD

O workflow em `.github/workflows/dbt-ci.yml` automatiza:

1. `dbt run`
2. `dbt test`
3. `dbt docs generate`
4. Publicação dos relatórios no GitHub Pages

---
