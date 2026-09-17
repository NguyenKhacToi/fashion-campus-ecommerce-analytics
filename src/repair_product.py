from pathlib import Path
import csv

project_root = Path(__file__).resolve().parent.parent
raw_path = project_root / "data" / "raw" / "product.csv"
processed_path = project_root / "data" / "processed" / "product_clean.csv"

expected_columns = [
    "id",
    "gender",
    "masterCategory",
    "subCategory",
    "articleType",
    "baseColour",
    "season",
    "year",
    "usage",
    "productDisplayName",
]


def repair_product_csv():
    repaired_rows = []
    malformed_count = 0

    with open(
        raw_path,
        "r",
        encoding="utf-8",
        newline="",
    ) as file:

        reader = csv.reader(file)

        header = next(reader)

        if header != expected_columns:
            raise ValueError(
                "Unexpected product.csv header"
            )

        for line_number, row in enumerate(reader, start=2):

            if len(row) == len(expected_columns):
                repaired_rows.append(row)

            elif len(row) > len(expected_columns):
                malformed_count += 1

                repaired_row = row[:9] + [
                    ",".join(row[9:])
                ]

                repaired_rows.append(repaired_row)

            else:
                raise ValueError(
                    f"Row {line_number} has only "
                    f"{len(row)} fields"
                )

    processed_path.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    with open(
        processed_path,
        "w",
        encoding="utf-8",
        newline="",
    ) as file:

        writer = csv.writer(file)

        writer.writerow(expected_columns)
        writer.writerows(repaired_rows)

    print(f"Original rows: {len(repaired_rows):,}")
    print(f"Malformed rows repaired: {malformed_count:,}")
    print(f"Output: {processed_path}")


if __name__ == "__main__":
    repair_product_csv()