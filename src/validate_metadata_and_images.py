
import os
import json
from PIL import Image

# --- CONFIGURATION (resolved relative to script location) ---
BASE_DIR = os.path.dirname(os.path.abspath(__file__))  # Path to src/

# --- CONFIGURATION ---
METADATA_FILE = os.path.join(BASE_DIR, "..", "data-raw", "image_metadata.json")
IMAGES_DIR = os.path.join(BASE_DIR, "..", "images-raw", "preprocessed")

# --- REQUIRED FIELDS (update if schema changes) ---
REQUIRED_FIELDS = [
    "species_name", "common_name", "image_filename", "location", "depth_m",
    "habitat", "size_mm", "taxonomy", "diet", "interesting_facts", "color_notes",
    "classification_type", "pic_location", "nudi_link", "inaturalist_link",
    "seaslugforum_link", "worms_link", "wikipedia_link"
]

# --- MAIN VALIDATION FUNCTION ---
def validate_metadata_and_images():
    with open(METADATA_FILE, "r", encoding="utf-8") as f:
        metadata = json.load(f)

    incomplete_entries = []
    missing_images = []
    corrupted_images = []
    valid_entries = []

    for species_key, entry in metadata.items():
        # Check for missing fields
        missing_fields = [field for field in REQUIRED_FIELDS if field not in entry or not entry[field]]
        if missing_fields:
            incomplete_entries.append((species_key, missing_fields))
            continue

        # Check image existence
        image_path = os.path.join(IMAGES_DIR, entry["image_filename"])
        if not os.path.exists(image_path):
            missing_images.append(entry["image_filename"])
            continue

        # Check image readability
        try:
            with Image.open(image_path) as img:
                img.verify()
            valid_entries.append(species_key)
        except Exception:
            corrupted_images.append(entry["image_filename"])

    # --- REPORT ---
    print("\n--- VALIDATION REPORT ---")
    print(f"Total species entries: {len(metadata)}")
    print(f"Valid entries: {len(valid_entries)}")
    print(f"Incomplete metadata entries: {len(incomplete_entries)}")
    print(f"Missing image files: {len(missing_images)}")
    print(f"Corrupted image files: {len(corrupted_images)}")

    if incomplete_entries:
        print("\n>> Incomplete Entries:")
        for species, fields in incomplete_entries:
            print(f"  - {species}: Missing {fields}")

    if missing_images:
        print("\n>> Missing Images:")
        for img in missing_images:
            print(f"  - {img}")

    if corrupted_images:
        print("\n>> Corrupted Images:")
        for img in corrupted_images:
            print(f"  - {img}")

# --- EXECUTE ---
if __name__ == "__main__":
    validate_metadata_and_images()

# python src/validate_metadata_and_images.py
