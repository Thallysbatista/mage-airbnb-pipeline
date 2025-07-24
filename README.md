# Airbnb Analytics Pipeline

Este repositório contém o pipeline completo de ingestão, transformação e entrega de dados do dataset Airbnb, utilizando **dbt**, **Mage** (via Docker Compose), **BigQuery**, **Metabase** e **GitHub Actions**.

---

## 📁 Estrutura do Projeto

```text
repo-root/
├── dbt_airbnb_project/   # Código dbt, modelos e configurações
│   ├── analyses/         # Explorações ad-hoc em SQL
│   ├── macros/           # Macros reutilizáveis
│   ├── models/           # Camadas: staging, trusted, delivery
│   ├── snapshots/        # Versões históricas de dados
│   ├── seeds/            # Dados fixos (ex.: calendário)
│   ├── tests/            # Testes personalizados em SQL
│   └── dbt_project.yml   # Configurações principais do dbt
├── .github/              # CI/CD com GitHub Actions
├── docker-compose.yml    # Mage via Docker
└── README.md             # Documentação principal
```

---

## 🚀 Como começar

### 1. Clone o repositório e instale dependências

```bash
git clone <repo_url>
cd dbt_airbnb_project
python -m venv venv && source venv/bin/activate
pip install dbt-bigquery pre-commit
pre-commit install
```

### 2. Inicie o Mage com Docker Compose

```bash
docker-compose up -d
```

### 3. Configure o perfil dbt no `profiles_local.yml`

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
```

### 4. Execute o pipeline completo

```bash
dbt debug
dbt run
dbt test
```

### 5. Gere e visualize a documentação

```bash
dbt docs generate
dbt docs serve --port 8001
```

---

## 📊 Deploy do Metabase com Docker na GCP

Você pode hospedar o Metabase em uma **VM da GCP usando Docker** para explorar os dados com dashboards interativos:

### ✔️ Passos principais:

1. Crie uma **VM na GCP** com:

   * Sistema: **Ubuntu 22.04**
   * Localização: `southamerica-east1-a` (São Paulo)
   * Tipo de máquina: `e2-micro` ou `e2-small` para baixo custo
   * Disco: 10 GB
   * Marque as opções **Allow HTTP** e **Allow HTTPS**

2. Acesse a VM via SSH e execute:

```bash
sudo apt update && sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
```

3. Suba o container do Metabase:

```bash
docker run -d \
  --restart always \
  -p 80:3000 \
  --name metabase \
  -e MB_DB_FILE=/metabase.db \
  -e JAVA_TIMEZONE=America/Sao_Paulo \
  metabase/metabase
```

4. Acesse o Metabase pelo IP externo da VM:
   👉 `http://<seu-ip-gcp>`

---

### ⚠️ Observações importantes

* Se usar **IP dinâmico**, ele mudará sempre que reiniciar a VM.
* O Metabase usa por padrão a porta `3000`, mapeada para `80` no container.

---

## 🧱 Convenções de Código

* `stg_*`: staging
* `trusted_*`: transformações e lógica de negócio
* `delivery_*`: tabelas finais para consumo

**Estilo SQL:**

* Vírgulas à esquerda
* Casts explícitos
* Snake case

**YAML:**

* `description:` para cada coluna
* `tests:` para validações
* `exposures:` para dashboards e apps

---

## 📚 Documentação Adicional

* **Exposures**: `models/exposures/exposures.yml`
* **Metrics**: `models/metrics/metrics.yml`
* **Macros**: `macros/docs/`

---

## 🔄 CI/CD

O workflow `.github/workflows/dbt-ci.yml` realiza:

1. `dbt run`
2. `dbt test`
3. `dbt docs generate`
4. Publicação no GitHub Pages

---
