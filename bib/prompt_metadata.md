
# Prompt for Nudibranch Metadata Completion

I am developing an R package called `SeaSlugSpectra` that generates biologically inspired colour palettes from images of nudibranch species.

I have a list of **42 species** (scientific names in `Genus_species` format) and a corresponding `image_metadata.json` file that needs to be filled with biologically accurate metadata.

Help complete the following metadata fields for each species. The JSON structure will be programmatically integrated into the library project. Please return the results in structured JSON format matching the schema below.

---

## Fields to Complete (for each species)

1. `common_name`: Widely recognised English name (if one exists)  
2. `location`: General region or known collection area  
3. `depth_m`: Typical observed depth range (mean or range preferred, in metres)  
4. `habitat`: Type of benthic environment (e.g., coral reef, seagrass, sandy bottom)
5. `size_mm`: Average or maximum adult body size in millimetres  
6. `taxonomy`: Structured object with:

   - `family`
   - `order`

7. `diet`: Primary prey or feeding strategy  
8. `interesting_facts`: Short fact, ecological or behavioural insight  
9. `color_notes`: Description of its colour pattern

---

## Shared Field (for all species)

For all species, you can assume the following identical entry under:

```json
"extraction_parameters": {
  "n_colors": 5,
  "method": "kmeans",
  "color_space": "RGB",
  "resize": false,
  "sample_fraction": 1.0,
  "seed": 42
}
```

---

## Output Format

For each species, return a JSON object structured as the here example:

```json
{
  "species_name": "Chromodoris willani",
  "image_filename": "Chromodoris_willani.jpg",
  "common_name": "Willan's chromodoris",
  "location": "Lembeh Strait, Indonesia",
  "depth_m": 15,
  "habitat": "coral reef",
  "size_mm": 45,
  "taxonomy": {
    "family": "Chromodorididae",
    "order": "Nudibranchia"
  },
  "diet": "Sponges",
  "interesting_facts": "Named after nudibranch expert Dr. Richard Willan.",
  "color_notes": "Sky-blue body with white longitudinal lines and darker gill plumes.",
  "extraction_parameters": {
    "n_colors": 5,
    "method": "kmeans",
    "color_space": "RGB",
    "resize": false,
    "sample_fraction": 1.0,
    "seed": 42
  }
}
```

You may consult credible sources such as Sea Slug Forum, WoRMS, iNaturalist, Wikipedia, scientific papers, and nudibranch photo ID guides. If no data exists for a field, use `""`.

---

## Species Groups

To support manageable lookup tasks, the 42 species have been divided into 6 groups.

### Group 1

```
Glaucus_atlanticus
Berghia_coerulescens
Costasiella_kuroshimae
Chromodoris_willani
Phidiana_militaris
Felimare_cantabrica
Nembrotha_cristata
```

### Group 2

```
Paraflabellina_ischitana
Nembrotha_kubaryana
Nembrotha_purpureolineata
Hypselodoris_kanga
Nembrotha_megalocera
Flabellina_iodinea
Goniobranchus_kuniei

```

### Group 3

```
Chromodoris_annae
Hexabranchus_sanguineus
Phyllidia_varicosa
Flabellina_affinis
Hypselodoris_apolegma
Thecacera_pacifica
Ceratosoma_amoenum
```

### Group 4

```
Hypselodoris_tryoni
Hypselodoris_variobranchia
Bornella_anguilla
Phyllidia_ocellata
Glossodoris_cincta
Mexichromis_macropus
Aegires_villosus
```

### Group 5

```
Felimare_picta
Janolus_savinkini
Goniobranchus_geminus
Polycera_quadrilineata
Fjordia_lineata
Hermissenda_crassicornis
Ceratosoma_tenue
```

### Group 6

```
Felimare_californiensis
Tambja_verconis
Hypselodoris_decorata
Hypselodoris_infucata
Tambja_blacki
Hypselodoris_obscura
Chromodoris_magnifica
```

---

Please ensure each JSON block includes all required fields, formatted for structured ingestion. You can use that as example:

```
  "Hexabranchus_sanguineus": {
    "image_filename": "Hexabranchus_sanguineus.jpg",
    "common_name": "Spanish Dancer",
    "location": "Tropical Indo-Pacific (East Africa, Red Sea, French Polynesia, Japan, Australia)",
    "depth_m": "20-50",
    "habitat": "Coral reefs, rocky reefs, rubble, and sandy areas",
    "size_mm": "400",
    "taxonomy": {
      "family": "Hexabranchidae",
      "order": "Nudibranchia"
    },
    "diet": "Sponges (non-selective feeder, preys on at least 11 genera of sponges)",
    "interesting_facts": "One of the largest known nudibranch species, growing up to 40 cm. It can swim away by flapping its appendages when threatened, resembling a flamenco dancer, which earned it the name 'Spanish Dancer'. It also secretes a potent chemical derived from sponges for defense, which is passed to its egg ribbons.",
    "color_notes": "Usually mottled red with hints of whites, oranges, and pinks. Its bright warning colors act as predator deterrents.",
    "extraction_parameters": {
      "n_colors": 5,
      "method": "kmeans",
      "color_space": "RGB",
      "resize": false,
      "sample_fraction": 1.0,
      "seed": 42
    }
  }
```