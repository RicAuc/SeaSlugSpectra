
# Nudibranchs: Morphology, Ecology, and Evolutionary Significance

Develop a personalised R package that generates qualitative colour palettes based on images of marine nudibranch species. This work is inspired by the MoMAColors GitHub repository, which provides palettes derived from artworks at the Museum of Modern Art in New York.

The objective is to build an R library that captures the rich pigmentation patterns of nudibranchs—each palette corresponding to a specific species. These palettes will be extracted from curated images and structured for use in scientific visualisation, design, and educational applications.

I will be developing this package from scratch, using GitHub for version control, Visual Studio Code as my main development environment, and GitHub Copilot for assisted coding. I plan to follow best practices in R package development but may need guidance throughout the design and implementation phases.

Can you help me set up this project step by step—starting from high-level structuring and planning, all the way to implementation, documentation, and packaging?

---

## Introduction to Nudibranchs
This is Suzie. Suzie is a sea slug. She's a mollusk in the class Gastropoda, which includes snails and slugs. Suzie and her kind remind us that sometimes, taking a risk, like leaving your shell and untwisting, can lead to the most beautiful and unexpected transformations. More specifically, she's a nudibranch. There are about 3,000 known species of nudibranchs. They come in two main body plans.

### Eolid Nudibranchs
The first are the eolid nudibranchs, whose backs are covered in finger-like extensions called cerata. These cerata are actually extensions of their digestive system, and they also help the nudibranch breathe. Eolids have a special relationship with their food.

### Dorid Nudibranchs
The other main group are the dorid nudibranchs. They have a sturdier, more oval body and a mantle that can look like a frilly skirt or a fashionable poncho Some dorid species, like the Spanish dancer nudibranch, can use their mantle to swim. They flex their body in a rhythmic, undulating motion to move through the water.

## Nudibranch Sensory Organs
Nudibranchs have a pair of sensory tentacles called rhinophores on top of their heads. These function a lot like nostrils, detecting chemical signals in the water.

Near the base of their rhinophores are their eyes, but these are very simple. Nudibranch eyes are tiny, only capable of distinguishing between light and dark.

On the back of the dorid nudibranch near their anus, they have a plume of gills. These gills are highly folded structures that maximize the surface area for the extraction of oxygen from the water.

## Evolutionary History and Torsion
Though they don't have shells now, baby nudibranchs do resemble snails with shells.

To understand this, we need to go back in time to the ancestral gastropod. Scientists call the twisted body plan that characterizes snails and slugs torsion.

This evolutionary twist of the body causes the anus, gills, and mantle cavity to migrate forward, eventually resting above the head. It's thought that this arrangement helped the ancestral gastropod pull its head into its shell first when threatened.

But as nudibranchs transition from the larval to the juvenile state, they shed their shell and untwist, a process called detorsion. This rearranges their organs from a squished, twisted mess into a more logical, "unsnailed" configuration.

## Feeding Habits
Nudibranchs have two small feeding tentacles between their rhinophores that help them locate food.

Nudibranchs are carnivorous predators and will eat a variety of animals, including sponges, barnacles, hydroids, other slugs, and even other nudibranchs.

Most species eat using a tough beak and a unique tongue-like structure called a radula that's covered in rows of tiny teeth. The radula acts like a chainsaw, scraping or cutting off pieces of prey.

The Melibe genus has a completely different way of eating. They have evolved a specialized head shaped like a Venus flytrap to scoop small crustaceans and other organisms off the seafloor.

## Defense Mechanisms
Since they don't have shells to hide in, nudibranchs have to get creative when it comes to defending themselves.

Some are excellent at camouflage, blending seamlessly into their surroundings, allowing them to hide from predators.

Other nudibranchs, like the ghost Melibe, are transparent, making them difficult to see.

Many dorid nudibranchs consume toxic prey and incorporate the toxins into their own bodies, making them unappetizing to predators. Their bright coloring acts as a warning sign.

Eolid nudibranchs take this a step further. They're able to eat organisms with stinging cells, called nematocysts, and relocate those stinging cells, undischarged, to the very tips of their cerata, where they can be used for the nudibranch's own defense.

Some eolid nudibranchs even steal zooxanthellae, which are microscopic plant cells, from their prey. They then incorporate these into their cerata, essentially becoming solar-powered, able to produce their own food from sunlight.

## Reproduction
Nudibranchs are solitary creatures, so when it comes time to reproduce, they typically find a mate by following a slime trail left by another nudibranch.

Their genitals are located on the right side of their body, near their head.

Nudibranchs are hermaphrodites, meaning each individual possesses both male and female reproductive organs.

During mating, both nudibranchs insert their penises into the other's vagina, resulting in mutual fertilization.

The nudibranch penis is often barbed and hook-shaped, which can make uncoupling difficult. Some species, like Chromodoris reticulata, have evolved a surprising solution: they simply detach their penis after mating and regrow a new one within 24 hours.

After successful fertilization, nudibranchs lay their eggs in elaborate, ribbon-like strings or rosettes.

## Introduction

Nudibranchs, commonly referred to as *sea slugs* or poetically as *butterflies of the sea*, constitute a diverse order of marine gastropod molluscs, comprising over 4,700 described species. 

A key distinguishing characteristic of these invertebrates is the evolutionary loss of the shell during the adult stage (an adaptation that sets them apart from most other gastropods).

This transition from a shelled to a shell-less condition has catalysed a striking diversification in body shape and pigmentation patterns.

## Morphology and Terminology

Similar to terrestrial slugs in locomotion, they glide along substrates underwater. The term *nudibranch* translates to “naked gills”, referencing the external gill structures located on the dorsum. 

- In **dorid nudibranchs**, these gills appear as rosette-like plumes situated towards the posterior end.
- In **aeolid nudibranchs**, the gills are organised into numerous spike-like structures called cerata, which also serve additional defensive functions in some species.

## Feeding Ecology

Nudibranchs are predominantly carnivorous and occupy a critical trophic position within benthic marine communities. 

Feeding is often highly specialised, with many species exhibiting narrow dietary preferences.

Their diet consists primarily of sessile invertebrates, including: Sponges, Cnidarians (e.g., corals, anemones), Tunicates and Bryozoans.

## Defensive Adaptations

The evolutionary loss of the shell has driven the development of multiple alternative defence mechanisms, such as:

- **Chemical defence**: Many nudibranchs produce or sequester toxic compounds derived from their prey.
- **Camouflage and mimicry**: Some species closely resemble their environment or their prey organisms.
- **Aposematic colouration**: Bright and contrasting colours signal toxicity or distastefulness to potential predators. The effectiveness of this strategy in aquatic systems is still under active study.
- **Symbiosis with zooxanthellae**: Certain species host photosynthetic dinoflagellates, gaining energetic benefits via endosymbiosis.

## Evolutionary and Biological Insights

Nudibranchs serve as a model clade for studying broader biological and evolutionary processes, such as:

- **Adaptive radiation**  
- **Evolutionary trade-offs**  
- **Predator–prey co-evolution**  

The evolutionary shift from a shelled to a shell-less morphology, combined with the elaboration of complex chemical and visual defences, represents a significant adaptive innovation. This trajectory has enabled nudibranchs to exploit a broad range of ecological niches, resulting in the wide morphological and chromatic diversity observed across the order.

## Nudibranch Facts

Nudibranchs are a remarkably diverse group of marine gastropods, inhabiting oceans worldwide, from sunlit tropical reefs to the deep sea at depths exceeding 700 m. Their sizes vary dramatically, from just a few millimetres to upwards of 30 cm, and while most live for a few weeks to about a year, larger species or those in cooler environments may survive longer.

Uniquely adapted, nudibranchs are obligate carnivores They feed using a *radula*, a toothed, ribbon-like organ that rasps or pierces prey tissues.

Some species are bioluminescent, notably *Bathydevius* found in deep-sea environments, and others emit distinctive odours—for instance, *Melibe leonina* has a watermelon-like scent, *Acanthodoris lutea* cedar, and *Peltodoris nobilis* citrus—which may serve communication or deterrent functions.

Reproductively, nudibranchs are *simultaneous hermaphrodites*. They engage in reciprocal mating and subsequently lay eggs in spiral or ribbon-like masses. Hägglings later hatch into veliger larvae bearing rudimentary shells, though in some lineages this stage is entirely bypassed.

Finally, certain nudibranchs engage in *kleptoplasty*: they sequester intact chloroplasts from algae (or zooxanthellae), which remain photosynthetically active within the cerata, supplementing the animal’s energy through light capture.

## Two Types of Nudibranchs

There are two main types of nudibranchs: Dorid nudibranchs and aeolid nudibranchs. These terms refer to what the nudibranch body shape looks like.

### Dorid Nudibranchs

Dorid nudibranchs look fairly smooth, like typical land slugs. There is a tuft of feathery appendages toward the back of these nudibranchs that serve as gills.

### Aeolid Nudibranchs

Aeolid nudibranchs are covered in spikes along their backs called cerata, which are the animal’s gills. The cerata have an added feature, many aeolid nudibranchs ingest stinging cells from their prey and store them in their cerata for later use.

## Nudibranch Anatomy

- **Rhinophores**: The word rhinophore comes from the Greek root *rhino*, which means “nose.” Rhinophores are scent receptors that sense chemical molecules dissolved in the water. Rhinophores help nudibranchs find their food. Because rhinophores are vulnerable to environmental dangers, many species of nudibranch are able to retract the rhinophores into a pocket beneath the skin.
- **Gill Plume**: The flower-like plume on the back of dorid nudibranchs is used for respiration. These are the “naked gills” for which nudibranchs are named.
- **Cerata**: In aeolid nudibranchs, cerata are the nudibranch’s respiratory organ much like the gill plume is in dorid nudibranchs. In some species, cerata are used for attack and defense.
- **Foot**: The flat, broad muscle at the bottom of the nudibranch is how a nudibranch propels itself across the ground. Some nudibranchs can short distances by flexing the foot muscle.
- **Eye Spots**: Nudibranchs do have eyes, but scientists believe these rudimentary organs can only discern the difference between light and dark.
- **Mantle**: In dorid nudibranchs, the mantle extends over the foot, offering some protection to the creatures.
- **Oral Tentacles**: The oral tentacles are used for identifying food by touch and taste.

---

## Species List (Formatted with Underscores)

```
Genus_species
```

---

## Web References

1. [iNaturalist](https://www.inaturalist.org/)
2. [WoRMS](https://www.marinespecies.org/)
3. [Sea Slug Forum](http://www.seaslugforum.net/)
4. [Nudipixel](https://nudipixel.net/)

## Bibliographic References

1. [Chen et al. (2018) — *PLOS ONE*](https://doi.org/10.1371/journal.pone.0192177)  
2. [Vries et al. (2024) — *PLOS ONE*](https://doi.org/10.1371/journal.pone.0317704)  
3. [Winters et al. (2022) — *Scientific Reports*](https://doi.org/10.1038/s41598-022-23400-9)  
4. [Irwin et al. (2024) — *Ecology and Evolution*](https://doi.org/10.1002/ece3.10676)  
5. [Wollesen et al. (2024) — *Journal of Experimental Biology*](https://doi.org/10.1242/jeb.245213)  
6. [Goodheart et al. (2021) — *PeerJ*](https://doi.org/10.7717/peerj.10525)  
7. [Chen et al. (2024) — *Ecology and Evolution*](https://doi.org/10.1002/ece3.11014)  
8. [Avila (2017) — *Natural Product Reports*](https://doi.org/10.1039/C7NP00041C)
