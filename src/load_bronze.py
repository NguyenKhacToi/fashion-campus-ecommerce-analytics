from pathlib import Path
import pandas as pd
from google.cloud import bigquery
from google.oauth2 import service_account


# =========================
# Configuration
# =========================

project_id = "fashion-campus-508609"
dataset_id = "fashion_campus_bronze"
key_path = "C:/Users/LENOVO/fashion-campus-ecommerce-analytics/config/fashion-campus-508609-fe010a7b3ff2.json"
project_root = Path(__file__).resolve().parent.parent
raw_path = project_root / "data" / "raw"

# =========================
# BigQuery connection
# =========================

credentials = service_account.Credentials.from_service_account_file(key_path)
client = bigquery.Client(credentials=credentials,project=project_id)

# =========================
# Load function
# =========================

def load_dataframe_to_bigquery(
    file_name: str,
    table_name: str,
):
    file_path = raw_path / file_name

    print(f"\nLoading: {file_path}")

    df = pd.read_csv(file_path)

    table_ref = f"{project_id}.{dataset_id}.{table_name}"

    job_config = bigquery.LoadJobConfig(
        write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE,
        autodetect=True,
    )

    job = client.load_table_from_dataframe(
        df,
        table_ref,
        job_config=job_config,
    )

    job.result()

    print(
        f"Loaded {job.output_rows:,} rows "
        f"into {table_ref}"
    )


def load_product_to_bigquery():

    file_path = project_root / "data" / "processed" / "product_clean.csv"

    print(f"\nLoading: {file_path}")

    df = pd.read_csv(file_path)

    table_ref = f"{project_id}.{dataset_id}.product"

    job_config = bigquery.LoadJobConfig(
        write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE,
        autodetect=True,
    )

    job = client.load_table_from_dataframe(
        df,
        table_ref,
        job_config=job_config,
    )

    job.result()

    print(
        f"Loaded {job.output_rows:,} rows "
        f"into {table_ref}"
    )

# =========================
# Main
# =========================

if __name__ == "__main__":

    load_dataframe_to_bigquery(
        "customer.csv",
        "customer",
    )

    load_dataframe_to_bigquery(
        "transaction_new.csv",
        "transaction",
    )

    load_dataframe_to_bigquery(
    "click_stream_new.csv",
    "click_stream",
    )

    load_product_to_bigquery()