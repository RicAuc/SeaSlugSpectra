
# Prompt for Nudibranch Metadata Completion

I am developing an R package called `SeaSlugSpectra` that generates biologically inspired colour palettes from images of nudibranch species.

I have a list of species (scientific names in `Genus_species` format) and a corresponding `image_metadata.json` file that needs to be filled with biologically accurate metadata.

Help complete the following metadata fields for each species. The JSON structure will be programmatically integrated into the library project. Please return the results in structured JSON format matching the schema below.

## Output Format

For each species, return a JSON object structured as the here example:

```json
  "Glaucus_atlanticus": {
    "species_name": "Glaucus atlanticus",
    "common_name": "Blue dragon, sea swallow, blue sea slug",
    "image_filename": "Glaucus_atlanticus.jpg",
    "location_distribution": "Pelagic zone (open ocean), carried by winds and currents; primarily tropical and subtropical areas. Documented sightings include Bay of Bengal, off Tamil Nadu and Andhra Pradesh in India. Populations are localized within distinct ocean basins.",
    "depth": "Surface waters, typically floating on the ocean surface.",
    "habitat": "Open ocean surface.",
    "size_mm": "30",
        "taxonomy": {
        "order": "Nudibranchia",
        "family": "Glaucidae"
        },
    "diet": "Cnidarians, including venomous siphonophores like the Portuguese man o' war. Uses a radula with serrated teeth, strong jaw, and denticles to grasp and chip prey.",
    "interesting_facts": "Glaucus atlanticus is a pelagic sea slug that floats on the ocean surface, feeding on jellyfish and other cnidarians. It has a unique ability to store the stinging cells (nematocysts) of its prey in its own tissues",
    "color_notes": "Ventral side (upwards) is dark and pale blue; true dorsal surface (downwards) is silvery grey. Features dark blue stripes on its head. Dorsal area of foot varies from dark blue to brown with a silver central position.",
    "classification_type": "",
    "pic_link": ""
  }
```

You may consult credible sources such as Sea Slug Forum, WoRMS, iNaturalist, Wikipedia, Nudipixel, scientific papers, and nudibranch photo ID guides. If no data exists for a field, use `""`.

---

## Species Groups

To support manageable lookup tasks, the species have been divided into groups.

### Supplemetary group

```
Caloria_militaris
Chelidonura_mandroroa
Goniobranchus_vibratus
Goniobranchus_coi
Tambja_sagamiana
Hypselodoris_kaname
Hypselodoris_nigrostriata
Hypselodoris_krakatoa
Goniobranchus_leopardus
Goniobranchus_fidelis
```

---

Please ensure each JSON block includes all required fields, formatted for structured ingestion
