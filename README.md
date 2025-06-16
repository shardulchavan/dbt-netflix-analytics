# 🎬 Netflix Analytics — dbt Project

This dbt project transforms MovieLens data into clean, enriched, and analytics-ready models. It includes snapshots for change tracking, tests for data quality, and KPIs for genre-based insights.

---

## 📁 Project Structure

```plaintext
netflix_dbt/
├── analyses/              # ad hoc analysis files
├── dbt_packages/          # packages installed via dbt
├── logs/                  # dbt run logs
├── macros/                # custom SQL macros
├── models/
│   ├── dim/               # dimension models
│   ├── fct/               # fact tables
│   ├── mart/              # business KPIs and final marts
│   ├── staging/           # staging layer aligned with raw sources
│   └── schema.yml         # column-level tests and docs
├── seeds/                 # static CSVs for seeding reference data
├── snapshots/             # snapshot models for historical tracking
│   ├── snap_ratings.sql
│   └── snap_tags.sql
├── target/                # dbt compiled artifacts (ignored)
├── tests/                 # custom data tests (SQL-based)
│   ├── no_null_test.sql
│   └── relevance_score_test.sql
├── .gitignore
├── dbt_project.yml        # dbt project configuration
└── README.md              # project overview (you are here!)
```

## Data Flow
1. Sources: Raw data from the MOVIELENS.RAW schema (e.g., ratings, movies, genome tags).

2. Staging Models: Basic cleaning and standardization (src_* models).

3. Marts: Analytical tables including:
- fct_ratings: Incremental fact table for movie ratings.

- dim_movies: Enriched movie dimension with genre and release info.

- mart_user_behavior: User-level engagement insights.

## 🚀 Getting Started
Prerequisites
- Python 3.8+
- dbt-core (v1.9+)
- Snowflake account
- Git

## Install & Run
```bash
# Create and activate virtual environment
python -m venv venv
source venv/bin/activate   # or .\venv\Scripts\activate on Windows

# Install dependencies
pip install dbt-snowflake

# Set up profiles.yml (Snowflake credentials)
# Located at: ~/.dbt/profiles.yml

# Run dbt
dbt deps          # Install packages (if any)
dbt seed          # Load static CSVs (if used)
dbt run           # Build models
dbt test          # Run tests

```
## 🔍 Key Features
- ✅ Incremental loading (e.g., fct_ratings)

- 🧹 Data cleansing with staging layers

- 🧪 Built-in data testing

- 🧱 Modular & reusable SQL patterns via macros
- 📸 Historical change tracking using **dbt snapshots** (`snap_tags`)

- 🛡️ Security & Best Practices


🤝 Contributing

Open to contributions! Please submit a pull request or open an issue if you have ideas, improvements, or bug fixes.


🙌 Acknowledgments
- MovieLens Dataset
- dbt Labs
- darshilparmar







