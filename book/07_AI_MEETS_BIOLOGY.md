# AI and Computation in Biology

---

## 1. Protein Structure Prediction and Design

### The AlphaFold Revolution and Its Sequels

**AlphaFold 2** (2020) solved the protein structure prediction problem as defined by CASP, achieving GDT scores above 90 for most targets. By November 2025, the AlphaFold Database contained **214 million predicted structures** spanning 23 terabytes. The original paper has been cited nearly **43,000 times**, and over 200,000 articles have used AlphaFold 2 in their methodology. More than **3 million researchers** across 190 countries have accessed the database, with over 30% of usage focused on disease-related research.

**AlphaFold 3** (2024, Nature) extended predictions beyond proteins to DNA, RNA, ligands, ions, and post-translational modifications. Key advances include:

- **50% more accurate** than the best traditional methods on the PoseBusters benchmark for protein-ligand interactions, without requiring structural information input
- Accuracy **doubled** for specific protein-ligand binding predictions compared to prior methods
- First AI system to surpass physics-based tools for biomolecular structure prediction
- As of November 2025, the AF3 paper had been cited over **9,000 times**

**Honest assessment of AF3 in drug discovery**: AlphaFold 3 provides good-enough structures in hours instead of months, but significant limitations remain. It struggles with stereochemistry, hallucinations in unstructured regions, protein dynamics, and accuracy for certain difficult targets. While AI-associated drugs demonstrate an 85% success rate in Phase I trials, Phase II efficacy validation remains at around **40% -- no different from conventional methods**. AF3 has not yet proven it can meaningfully improve the rate-limiting step: predicting whether a drug will actually work in patients.

### Open-Source Alternatives: Boltz and Chai

The democratization of structure prediction accelerated with open-source alternatives:

**Boltz-1** (MIT/Recursion, 2024): Fully open-source including training code and neural network architecture. On CASP15, Boltz-1 achieved LDDT-PLI of 65% for protein-ligand interactions. For the overall PoseBusters dataset, AF3 achieved 64.9% success rate vs. Boltz-1 trailing by ~10%.

**Chai-1** (Chai Discovery, 2024): Open-weight model (inference code only, no training code). DockQ>0.23 of 76% on CASP15 protein-protein targets vs. 83% for Boltz-1.

**ABCFold** (2025) was developed to streamline running and comparing AlphaFold 3, Boltz-1, and Chai-1 from a single input format.

### De Novo Protein Design: RFdiffusion and Beyond

The David Baker lab's **RFdiffusion** (2023, Nature) brought diffusion models to protein design, enabling generation of novel protein structures conditioned on user-specified constraints.

**RFdiffusion2** (2025, Nature Methods): Atom-level enzyme active site scaffolding. Successfully generated scaffolds for **41 of 41** diverse active sites in a benchmark, compared to 16/41 using previous methods. Designed enzymes for three distinct catalytic mechanisms with active candidates identified after testing fewer than 96 sequences each.

**RFdiffusion3** (December 2025, open-source): Ten-fold faster than RFdiffusion2. Generates new proteins that interact with any type of molecule commonly found inside living cells. Matched or outperformed prior tools on protein-protein, protein-DNA, protein-small molecule, and enzyme design tasks.

**Antibody design breakthrough** (2025, Nature): A fine-tuned RFdiffusion network combined with yeast display screening enables de novo generation of VHHs, scFvs, and full antibodies binding to user-specified epitopes with atomic-level precision. Cryo-EM confirmed binding poses for designed VHHs targeting influenza hemagglutinin and *C. difficile* toxin B.

### AlphaProteo and Sequence Design

**AlphaProteo** (Google DeepMind, September 2024): First AI system for designing novel high-affinity protein binders. Achieves **3 to 300 times better binding affinities** than best existing methods. For the viral protein BHRF1, 88% of candidates bound successfully in wet lab testing. First to design a successful binder for VEGF-A. Notable failure: unable to design binders against TNF-alpha, illustrating that hard targets remain hard.

**ProteinMPNN** (Baker Lab): Achieved **53% sequence recovery** rate vs. Rosetta's 33%. Experimentally validated to rescue failed designs, increase stability and solubility, and redesign membrane proteins.

**ESM3** (EvolutionaryScale, January 2025, Science): 98 billion parameters trained on 2.78 billion proteins. First generative model that simultaneously reasons over sequence, structure, and function. Generated a novel fluorescent protein estimated to represent **>500 million years of evolutionary divergence** from known GFPs -- the protein folds and produces a functional chromophore.

**ESM Cambrian** (EvolutionaryScale, December 2024): Parallel model family to ESM3, focused on protein representation rather than generation. Scales up to 6 billion parameters. ESM C outperforms the much larger ESM-2 15B on protein contact prediction.

---

## 2. Foundation Models for Biology

### Single-Cell Foundation Models

**scGPT** (2024, Nature Methods): Generative pretrained transformer trained on >33 million cells. Optimized via transfer learning for cell type annotation, perturbation prediction, multi-batch integration, multi-omic integration, and gene network inference.

**Geneformer** (Theodoris et al., 2023, Nature): Transformer pretrained on ~30 million single-cell transcriptomes from Genecorpus-30M. Designed for transfer learning on limited data in disease contexts.

**scFoundation / xTrimoscFoundation-alpha** (2024, Nature Methods): 100 million parameters covering ~20,000 genes, pretrained on >50 million human cells. Asymmetric transformer architecture with read-depth-aware pretraining. State-of-the-art on gene expression enhancement, drug response prediction, perturbation prediction, and cell type annotation.

**CellFM** (2025, Nature Communications): Pretrained on 100 million human cells, representing yet another scaling of the approach.

### Critical Benchmarking: The Reality Check

A landmark 2025 study (Genome Biology) delivered a sobering assessment of single-cell foundation models:

- **Zero-shot performance**: Both scGPT and Geneformer performed **worse** than selecting highly variable genes (HVG) and using established methods like Harmony and scVI for cell type clustering
- **Gene expression prediction**: scGPT showed **limited ability** to predict held-out gene expression in both configurations tested
- **Fine-tuned performance**: Models showed genuine value when fine-tuned, with Geneformer achieving higher accuracy (but lower macro-F1) than scGPT, and scGPT performing better with limited training data
- **Conclusion**: Zero-shot capabilities have important limitations; the hype significantly outpaces demonstrated utility for exploratory analysis

### DNA and Genomic Foundation Models

**Nucleotide Transformer** (2024, Nature Methods): Models ranging from 50M to 2.5B parameters, trained on 3,202 diverse human genomes plus 850 genomes across phyla. The 2.5B multispecies model achieved highest overall performance across tasks, outperforming DNABERT-2 and Enformer on promoter and splicing tasks. NT-v2 models have 12kb context length (24x larger than DNABERT-1, 4x larger than DNABERT-2).

**DNABERT-2** (2023): Multi-species genome foundation model using byte pair encoding (BPE) tokenization rather than k-mer tokenization, enabling more efficient processing. Competitive performance with a smaller model footprint.

**Comprehensive benchmark** (2025, Nature Communications): Evaluated DNABERT-2, Nucleotide Transformer V2, HyenaDNA, Caduceus-Ph, and GROVER across sequence classification, gene expression prediction, variant effect quantification, and topologically associating domain recognition. No single model dominated all tasks.

### Honest Assessment of Biological Foundation Models

**What works**: Fine-tuned models consistently outperform baselines for cell type annotation, batch integration, and variant effect prediction when labeled data is available. Pre-training clearly captures meaningful biological structure.

**What does not work yet**: Zero-shot generalization remains unreliable. The promise of a "GPT moment" for biology -- where a single pretrained model solves diverse tasks without fine-tuning -- has not materialized. Biology's combinatorial complexity, context-dependence, and sparse labeling make it fundamentally harder than natural language processing.

**The gap**: The most transformative promise -- predicting cellular behavior from sequence alone, without experimental data -- remains largely unrealized.

---

## 3. AI for Drug Discovery

### The Pipeline: What AI Has Actually Improved

**Target identification** (moderate evidence of improvement):
- Omics-driven insights paired with AlphaFold 3's structural predictions provide unprecedented clarity on binding modes and selectivity hypotheses
- Knowledge graph approaches and network pharmacology models accelerate identification of novel targets
- Pharma companies began fine-tuning AI models with proprietary structural data via federated learning in 2025
- *Caveat*: Target validation -- proving a target is causal in disease -- remains largely experimental and has not been dramatically accelerated by AI

**Hit finding** (strongest evidence of improvement):
- Virtual screening with AI-based docking (AF3, Boltz-2) is **1,000x faster** than traditional physics-based methods at near-equivalent accuracy
- Chai-2 achieved **16-20% hit rates** for zero-shot antibody design (claimed 100x improvement over prior computational benchmarks)
- Generative chemistry models (diffusion-based) produce novel scaffolds with improved synthetic feasibility
- This is where AI's impact is most concrete and reproducible

**Lead optimization** (growing evidence):
- ADMET prediction models improve property optimization cycles
- Diffusion models enhance hit rates, novelty, synthetic feasibility, and safety awareness
- *Caveat*: ~15% of AI-generated molecules still require impractical synthetic routes (>8 steps)

**Clinical prediction** (weakest evidence):
- AI drugs show 85% Phase I success (vs. industry average ~50%), likely because AI selects better-characterized targets
- Phase II success remains at **~40%, indistinguishable from conventional approaches**
- The clinical prediction problem -- will this drug work in patients? -- is fundamentally a biology problem, not a chemistry problem, and AI has not cracked it

### AI-Discovered Drugs: Clinical Reality

**Insilico Medicine (ISM001-055 / Rentosertib)**:
- TNIK inhibitor for idiopathic pulmonary fibrosis
- Both target and molecule discovered using AI (generative chemistry)
- Phase IIa results (June 2025, Nature Medicine): 71 patients, met primary safety endpoint, showed **dose-dependent improvement in FVC** (98.4 mL improvement at highest dose)
- First proof-of-concept clinical validation of AI-driven drug discovery
- By December 2024: 22 developmental candidates nominated, 10 programs in clinical stage, 4 Phase I studies completed

**Recursion/Exscientia** (merged November 2024, $688M all-stock deal):
- GTAEXS-617 (CDK7 inhibitor): Phase I/II for solid tumors
- EXS-74539 (LSD1 inhibitor): Phase I initiated early 2024
- DSP-1181 (OCD): Entered Phase I in 2020, development discontinued by 2022 without progressing to Phase II
- REC-994: Phase II for cerebral cavernous malformation, met primary safety endpoints

**Other notable programs**:
- Zasocitinib (TAK-279, Schrodinger/Nimbus-originated TYK2 inhibitor): Advanced to Phase III
- Lantern Pharma LP-300: Positive Phase II updates for NSCLC in non-smokers
- Over **75 AI-derived molecules** reached clinical stages by end of 2024
- As of end 2025: 9 drugs in Phase II/III, 5 in Phase I/II, 17 in Phase I

### How Many AI-Discovered Drugs Have Reached Market?

**Zero.** As of early 2026, no AI-discovered drug has received FDA approval. The fastest programs are in Phase II, with Phase III and NDA filing still years away. The most advanced candidate (zasocitinib/TAK-279) is in Phase III, but it was AI-assisted in target identification, not fully AI-designed. The earliest plausible FDA approval for a fully AI-discovered drug is likely **2027-2029**.

---

## 4. AI for Omics

### Single-Cell Analysis

Deep learning has transformed single-cell RNA-seq analysis across multiple tasks:

- **Dimensionality reduction and clustering**: Variational autoencoders (scVI, scVAE) outperform PCA-based approaches for batch correction while preserving biological variation
- **Cell type annotation**: Transfer learning from foundation models (scGPT, Geneformer, scFoundation) improves annotation, particularly for rare cell types, when fine-tuned
- **Trajectory inference**: Deep learning methods model continuous cellular differentiation paths, though classical methods (Monocle3, PAGA) remain competitive
- **Imputation and denoising**: scFoundation's read-depth-aware pretraining harmonizes across datasets with varying sequencing depths

### Spatial Transcriptomics

The explosion of spatial technologies (10x Visium, MERFISH, Slide-seq, Stereo-seq) has created urgent need for computational methods:

- **Spatial domain identification**: Graph neural networks (GNNs) model tissue architecture by treating spots/cells as nodes with spatial edges. stGRL (2025) uses multi-task graph contrastive learning
- **Cell deconvolution**: Inferring cell type proportions at each spatial location using reference-based and reference-free deep learning approaches
- **3D reconstruction**: SpaBatch (2025) enables cross-slice integration for 3D spatial domain identification
- **Multi-modal fusion**: STAMP achieves interpretability through topic modeling of gene modules with spatial context; SpaHDmap fuses morphological features from histological images

**Key challenges**: Data sparsity, multimodal and multi-source integration, missing annotations and modalities, and modeling spatiotemporal dependencies.

### Multi-Modal Integration

**SIMO** (2025, Nature Communications): Probabilistic alignment for spatial integration of multi-omics, integrating spatial transcriptomics with scRNA-seq, chromatin accessibility, and DNA methylation.

Integration strategies follow three paradigms:
1. **Early fusion**: Graph embeddings from each modality combined before training
2. **Intermediate fusion**: Node representation features fused during model training
3. **Late fusion**: Outputs from different architectures combined post-training

**Research gaps**: Spatial proteomics and metabolomics remain understudied; time-resolved multi-modal data is scarce; systematic prospective validation beyond benchmarks is lacking.

### Perturbation Prediction: A Cautionary Tale

**GEARS** (2023, Nature Biotechnology): Graph-enhanced gene activation and repression simulator. Integrates gene-gene relationship knowledge graphs to predict transcriptional responses to single and multigene perturbations.

**CPA** (Compositional Perturbation Autoencoder): Uses adversarial classifiers to separate basal cell state from perturbation effects, enabling combinatorial perturbation prediction.

**The sobering benchmark** (Ahlmann-Eltze, Huber, Anders; 2025, Nature Methods): "Deep-learning-based gene perturbation effect prediction does not yet outperform simple linear baselines." The study benchmarked five foundation models (including scGPT, scFoundation) and GEARS against deliberately simple linear models. **None outperformed the baselines** for predicting transcriptome changes after single or double perturbations. This paper is essential reading for anyone evaluating foundation model claims.

**PerturbNet** (2025, Molecular Systems Biology): Consistently outperforms both GEARS and baseline models, suggesting newer approaches may finally surpass simple methods, though independent replication is needed.

---

## 5. AI for Diagnostics

### Digital Pathology

**Paige AI**:
- **Paige Prostate** (2021): First FDA-authorized AI application in pathology
- **Paige Lymph Node**: FDA Breakthrough Device designation for detecting breast cancer metastases
- **PanCancer Detect** (April 2025): FDA Breakthrough Device designation. First AI tool designed to identify cancer across **40 tissue/organ types**, including tumors and pre-cancerous lesions of the GI tract, GU tract, breast, skin, and brain. Originally launched early 2024 covering 17 types

**PathAI**:
- AISight platform licensed to Quest Diagnostics for U.S. pathology use
- EU regulatory approval (CE mark) achieved in 2025
- FDA qualified the first AI-based tool for scoring liver biopsies in NASH/MASH clinical trials (December 2025)

### Radiology

AI in radiology dominates FDA device approvals:
- **1,039 radiology-specific AI tools** approved by the FDA as of mid-2025 (76% of all FDA-authorized AI/ML devices)
- Growth trajectory: Only 33 devices approved 1995-2015, vs. **221 in 2023 alone**
- GE HealthCare leads with 115 radiology AI authorizations
- Applications span chest X-ray triage, mammography screening, stroke detection, pulmonary embolism identification, and fracture detection

### Retinal Screening

Three FDA-cleared autonomous AI devices for diabetic retinopathy screening in the U.S.:
1. **IDx-DR** (Digital Diagnostics): First FDA-authorized autonomous AI diagnostic (2018)
2. **EyeArt** (EyeNuk)
3. **AEYE Health**

CPT code 92229 (approved 2021) enables reimbursement for autonomous AI retinal screening from Medicare/Medicaid. Adoption is growing but remains limited by workflow integration challenges and ophthalmologist resistance.

### Liquid Biopsy

**Guardant Health**:
- **Guardant Shield**: First FDA-approved liquid biopsy for colorectal cancer screening (July 2024)
- **Guardant360 CDx**: Six FDA-approved companion diagnostic claims as of 2025
- **Infinity platform** (2025): AI learning engine analyzing patient data to refine cancer detection predictions

**GRAIL/Galleri**:
- Multi-cancer early detection blood test; detects cancers across 50+ types
- Pathfinder 2 study: 36,000 adults; detected **40.4%** of cancer cases with **99.6% specificity** (0.4% false-positive rate)
- More than half of Galleri-detected cancers found at early stages
- Seeking FDA approval based on 2025 study results; not yet approved

**Market projection**: Multi-cancer early detection testing market estimated to grow from $1.92B (2024) to $7.52B by 2033.

### FDA-Approved vs. Experimental: Summary

| Category | FDA-Approved | Experimental/Pending |
|----------|-------------|---------------------|
| Radiology AI | >1,039 devices | Thousands more in development |
| Digital pathology | Paige Prostate, select tools | PanCancer Detect (Breakthrough designation) |
| Retinal screening | 3 autonomous systems | Expanding to other retinal diseases |
| Liquid biopsy (screening) | Guardant Shield (CRC) | Galleri (multi-cancer), many others |
| Liquid biopsy (companion dx) | Guardant360 CDx (6 claims) | Expanding indications |

---

## 6. LLMs in Biology

### Literature Mining and Knowledge Synthesis

LLMs are transforming how biologists interact with the literature:

- **Scale**: PubMed contains >36 million articles; no human can keep up. LLMs summarize, synthesize, and extract structured knowledge at scale
- **RAG-enhanced systems**: Retrieval-augmented generation allows LLMs to ground responses in specific papers, reducing hallucination
- **KG-CoI**: Knowledge Graph Chain of Inference significantly reduces hallucinations by verifying reasoning steps with domain-specific knowledge graphs
- **Practical impact**: Literature review that once took weeks can be done in hours; the quality depends entirely on human verification

### Hypothesis Generation

**BioDiscoveryAgent**: Leverages LLMs for hypothesis generation and experimental planning, boosting gene perturbation experiment efficiency by **46%** compared to baselines.

**CRISPR-GPT**: Uses LLMs to automate gene-editing experiment design, enhancing efficiency and precision of genetic modifications.

**IdeaBench** (2025): Benchmark of 2,374 recent biomedical target papers paired with 23,460 references for evaluating hypothesis generation quality.

**Key limitation**: Most studies emphasize novelty and diversity of hypotheses without addressing **truthfulness**. LLM-generated hypotheses frequently contain plausible-sounding but incorrect biological claims. Validation remains the bottleneck.

### Agentic AI for Biology

A 2025 Frontiers paper coined the term **"scAInce"** for agentic AI in science. Key developments:

- **ChemCrow architecture**: LLM front-end grafted onto specialized chemistry tools via action-queue API. Agents search reaction databases, propose synthetic routes, order reagents, schedule equipment, execute experiments, and analyze results
- **Agentic Lab** (2025, bioRxiv): Platform unifying LLM/VLM-driven reasoning with real-world laboratory operations using multi-agent orchestration
- **Nature 2024**: Reported fully autonomous synthesis of **29 organosilicon compounds**, 8 previously unknown
- **Agentic bioinformatics** (2025, Briefings in Bioinformatics): New field deploying autonomous agents for complex biological data analysis

### Will Computational Biology Be Automated?

This is the critical question. A nuanced assessment:

**What LLMs/AI can already do well (2025)**:
- Write standard bioinformatics pipelines (RNA-seq, scRNA-seq, variant calling)
- Generate boilerplate code for common analyses
- Debug and optimize existing code
- Explain methods and help with documentation
- Translate between programming languages

**What remains hard**:
- Designing novel analyses for unprecedented data types
- Making biological judgment calls (is this cluster a real cell type or an artifact?)
- Understanding the experimental context that shapes analytical choices
- Integrating domain knowledge that is not in the training data
- Troubleshooting wet-lab/dry-lab interface issues

**Likely timeline**:
- **2025-2027**: AI as powerful copilot; junior bioinformatics tasks partially automated; demand for bioinformaticians may temporarily increase (more people can attempt analyses)
- **2028-2030**: Routine pipeline work substantially automated; roles shift toward experimental design, biological interpretation, and method development
- **2030+**: Unclear; depends on whether AI achieves genuine biological reasoning or remains a sophisticated pattern matcher

**The skill premium shifts**: From "can you write a Snakemake pipeline?" to "can you design the right experiment and interpret the results?"

---

## 7. Robotics and Lab Automation

### Self-Driving Laboratories

Nature named self-driving labs one of the **top technologies to watch in 2025**. Key platforms:

**Emerald Cloud Lab (ECL)**:
- One of the largest commercial cloud laboratories in the world
- Carnegie Mellon opened the first university autonomous lab in 2024 through a partnership with ECL
- CMU Cloud Lab runs **>100 experiments simultaneously and continuously**
- Full remote access with AI-driven experimental design

**Strateos**:
- Pivoted from public subscription-based cloud lab access to **private on-premises cloud lab** business model
- Focuses on pharma/biotech enterprise clients

### Notable Self-Driving Lab Projects

**SAMPLE** (Romero Lab, 2024): Self-driving Autonomous Machines for Protein Landscape Exploration. Intelligent agent infers quantitative structure-activity relationships from experimental data, selects new protein sequences to test, and directs DNA assembly for next-round enzymes.

**MicroCycle** (Novartis, 2024): Upgraded automated high-throughput system that autonomously synthesizes compounds, purifies them, performs chemical and biochemical assays, analyzes data, and selects next compounds for synthesis and evaluation.

**Autonomous organosilicon synthesis** (Nature, 2024): Fully autonomous synthesis of 29 compounds, 8 previously unknown, demonstrating closed-loop AI-driven discovery.

### Current State and Limitations

Self-driving labs excel at:
- High-throughput screening with closed-loop optimization
- Iterative design-build-test cycles for well-defined parameter spaces
- Reproducible execution of complex multi-step protocols
- 24/7 operation without human fatigue

They struggle with:
- Handling unexpected failures (blocked tips, contamination, equipment malfunction)
- Tasks requiring fine manual dexterity (dissection, tissue handling)
- Experiments requiring judgment about when to deviate from protocol
- Integration across heterogeneous equipment from different vendors

---

## 8. The Automation Question

### If Claude Code Writes Bioinformatics Pipelines, What Happens?

This question deserves a frank answer. AI coding assistants (Claude, GPT, Copilot) can already generate functional bioinformatics code for standard tasks: read alignment, variant calling, differential expression analysis, clustering, visualization. The implications are real.

### Skills Becoming LESS Valuable

- **Memorizing tool syntax**: Knowing the exact samtools flags or ggplot2 aesthetics. AI handles this trivially
- **Boilerplate pipeline construction**: Connecting standard tools in standard ways (FASTQ -> alignment -> BAM -> counts -> DESeq2)
- **Language-specific expertise**: "I only know R" or "I only know Python" matters less when AI translates freely
- **Stack Overflow-style problem solving**: Finding the specific error fix for a known problem
- **Documentation writing**: AI generates competent documentation from code

### Skills Becoming MORE Valuable

- **Experimental design**: Knowing what to measure, how many replicates, which controls -- this requires biological understanding that AI cannot provide from data alone
- **Biological interpretation**: Is this differentially expressed gene meaningful? Is this cluster an artifact? This requires domain expertise, institutional knowledge, and often wet-lab intuition
- **Statistical reasoning**: Understanding when a method is appropriate, when assumptions are violated, what a p-value actually means in context. AI can apply tests but often does not flag when they are inappropriate
- **Data quality assessment**: Recognizing batch effects, sequencing artifacts, contamination, mislabeled samples. AI can detect patterns but often lacks the context to diagnose root causes
- **Novel method development**: Designing new algorithms for new data types requires mathematical creativity and biological insight that current AI lacks
- **Asking the right question**: The most important skill in science. AI is good at answering questions, not at knowing which questions matter

### The Honest Prediction

Computational biology roles will not be eliminated, but they will be restructured. The ratio of "time writing code" to "time thinking about biology" will shift dramatically toward the latter. A bioinformatician who can design experiments, interpret results, and communicate findings to wet-lab collaborators will be more valuable than ever. A bioinformatician whose primary skill is writing pipelines that AI can now generate will need to adapt.

The companies demanding "hybrid" professionals -- people who know both biology and data science -- are onto something. The floor of technical competence rises (everyone can generate code), but the ceiling of biological insight remains high.

---

## 9. Key Open Problems Where AI Could Be Transformative

### 1. Protein Dynamics and Conformational Ensembles
Current structure prediction provides static snapshots. Most drug targets, especially intrinsically disordered proteins (implicated in cancer, neurodegeneration, immune signaling), exist as dynamic ensembles. AI models that predict conformational landscapes -- not single structures -- would transform drug design for currently "undruggable" targets.

### 2. Genotype-to-Phenotype Prediction
Despite decades of GWAS, we cannot reliably predict complex phenotypes (disease risk, drug response, organismal traits) from genotype. This requires modeling gene-gene interactions, gene-environment interactions, epigenetics, and stochastic developmental variation. An AI system that reliably predicts clinical phenotype from genotype would revolutionize precision medicine.

### 3. Cellular Simulation
A complete computational model of a cell -- predicting metabolic states, signaling cascades, gene expression, and division in response to stimuli -- remains a grand challenge. Foundation models capture statistical patterns in omics data but do not simulate the mechanistic processes that generate those patterns.

### 4. Aging and Longevity
The biology of aging involves interacting processes across scales (DNA damage, mitochondrial dysfunction, senescence, immune decline). AI could integrate multi-scale data to identify intervention points, but current models lack the causal reasoning needed to distinguish drivers from passengers.

### 5. Brain Connectomics and Neural Computation
Mapping and interpreting the complete connectome of the human brain (86 billion neurons, ~100 trillion synapses) is an AI-scale problem. Current progress on *C. elegans* (302 neurons) and *Drosophila* (100,000+ neurons, completed 2024) demonstrates feasibility at small scale.

### 6. Ecosystem Modeling and Biodiversity
Predicting how ecosystems respond to perturbations (climate change, invasive species, habitat loss) requires modeling millions of interacting species. AI could transform environmental science if trained on sufficient ecological data.

### 7. Immunology and Immune Repertoire Understanding
The adaptive immune system generates ~10^13 unique antibody sequences per individual. Predicting antibody-antigen binding, T-cell receptor specificity, and immune response trajectories remains a massive unsolved problem with direct clinical relevance for vaccine design and autoimmunity.

### 8. De Novo Genome Design
Moving from reading genomes to writing them. While synthetic biology has achieved yeast chromosome synthesis (Sc2.0), designing whole genomes for specific functions requires understanding gene-gene interactions at a scale no current AI approaches.

### 9. Clinical Trial Prediction
Predicting which patients will respond to which treatments (beyond current companion diagnostics) could transform oncology and rare disease treatment. Current AI achieves marginal improvements; a breakthrough would require integrating multi-modal patient data at unprecedented scale.

### 10. Real-Time Pandemic Surveillance
AI-driven continuous monitoring of pathogen evolution, host-pathogen interactions, and transmission dynamics could provide early warning systems.

---

## 10. Limitations of AI in Biology

### What AI Fundamentally Cannot Do Yet

**1. Predict protein function from structure alone.** AlphaFold predicts structure, not function. The relationship between structure and function is many-to-many: the same fold can have different functions, and different folds can converge on similar activities. No AI system reliably predicts what a protein *does* from its predicted structure.

**2. Model intrinsically disordered proteins.** AI models trained on static structural data force intrinsically disordered proteins (IDPs/IDRs) into single predictable shapes. Many of biology's most important proteins -- those implicated in cancer, neurodegeneration, and immune signaling -- are functionally disordered. Current AI fundamentally misrepresents them.

**3. Capture dynamics at disparate spatiotemporal scales.** Protein folding (microseconds), signaling cascades (seconds-minutes), gene expression (hours), development (days-weeks), and evolution (years-millions of years) operate at vastly different timescales. No AI model bridges these scales.

**4. Reason causally about biological mechanisms.** Current AI identifies correlations and patterns. It does not distinguish correlation from causation. When an AI model identifies a gene associated with disease, it cannot determine whether that gene is a driver, a passenger, or a compensatory response without experimental intervention data.

**5. Handle the out-of-distribution problem.** Biology constantly produces novelty -- new mutations, new cell states, new environmental conditions. AI models perform well within their training distribution but can fail silently on novel inputs. In biology, the interesting cases are almost always out-of-distribution.

**6. Account for batch effects and technical artifacts.** Every biological dataset carries technical noise specific to the lab, protocol, sequencing platform, and day of preparation. AI models trained on one dataset may learn these artifacts as if they were biology. This remains the single largest practical problem in computational biology.

**7. Replace experimental validation.** AI predictions accelerate hypothesis generation, but every prediction must be validated experimentally. The wet lab remains the ground truth. AI has not reduced the need for experiments -- it has increased the number of hypotheses that need testing.

**8. Predict clinical outcomes from molecular data.** The gap between molecular mechanism and clinical outcome is vast. It involves pharmacokinetics, pharmacodynamics, immune responses, patient heterogeneity, and behavioral factors that molecular-level AI models do not capture. The persistent ~40% Phase II failure rate for AI-discovered drugs reflects this gap.

**9. Generate truly novel biological understanding.** AI has not, to date, produced a genuinely new biological principle or mechanism. It has accelerated structure prediction, improved virtual screening, and enhanced data analysis. But the conceptual breakthroughs -- CRISPR, mRNA vaccines, CAR-T therapy -- came from human insight into biological systems, not from pattern recognition in data.

**10. Handle data scarcity in rare diseases and non-model organisms.** Foundation models require massive training datasets. For rare diseases (each affecting <200,000 people), non-model organisms (the vast majority of biodiversity), and understudied tissues, training data is fundamentally scarce. AI exacerbates the existing bias toward well-studied systems.

### The Data Problem

Only **60%** of disease targets have adequate crystallographic data for structure-based AI design. Approximately 15% of AI-generated molecules require impractical synthetic routes (>8 steps). Murine pharmacokinetic models overpredict brain exposure by 3-5 fold for 40% of CNS candidates. Training data biases propagate through to model outputs with limited transparency.

### The Reproducibility Problem

Without transparency into failure modes, researchers cannot fully trace or troubleshoot limitations. Many high-profile claims (perturbation prediction, drug response prediction, clinical outcome prediction) have not survived independent benchmarking. The 2025 Nature Methods paper showing that GEARS and foundation models fail to outperform linear baselines for perturbation prediction is emblematic of a broader pattern: initial claims of AI superiority often do not hold up to rigorous, independent evaluation.

### The Honest Bottom Line

AI is a **powerful tool** for biology, not a **solution** to biology. It accelerates existing workflows, enables analyses at previously impossible scales, and generates hypotheses at unprecedented rates. But it does not understand biology in the way that would be needed to replace biological reasoning. The most productive path forward treats AI as a force multiplier for human scientists, not a replacement for them.

---

## Key References and Resources

### Protein Structure and Design
- Jumper et al. (2021). "Highly accurate protein structure prediction with AlphaFold." *Nature* 596:583-589.
- Abramson et al. (2024). "Accurate structure prediction of biomolecular interactions with AlphaFold 3." *Nature* 630:493-500.
- Watson et al. (2023). "De novo design of protein structure and function with RFdiffusion." *Nature* 620:1089-1100.
- Dauparas et al. (2022). "Robust deep learning-based protein sequence design using ProteinMPNN." *Science* 378:49-56.
- Hayes et al. (2025). "Simulating 500 million years of evolution with a language model." *Science* 387:eads0018.
- Krishna et al. (2025). "Atomically accurate de novo design of antibodies with RFdiffusion." *Nature*.

### Foundation Models
- Cui et al. (2024). "scGPT: toward building a foundation model for single-cell multi-omics using generative AI." *Nature Methods* 21:1470-1480.
- Theodoris et al. (2023). "Transfer learning enables predictions in network biology." *Nature* 618:616-624.
- Hao et al. (2024). "Large-scale foundation model on single-cell transcriptomics." *Nature Methods* 21:1481-1491.
- Dalla-Torre et al. (2024). "Nucleotide Transformer: building and evaluating robust foundation models for human genomics." *Nature Methods* 21:2399-2411.
- Ahlmann-Eltze, Huber, Anders (2025). "Deep-learning-based gene perturbation effect prediction does not yet outperform simple linear baselines." *Nature Methods*.

### Drug Discovery
- Ren et al. (2025). "A generative AI-discovered TNIK inhibitor for idiopathic pulmonary fibrosis: a randomized phase 2a trial." *Nature Medicine*.

### Diagnostics
- FDA AI/ML-Enabled Medical Devices database (updated continuously).

---

*Chapter compiled February 2026. This field moves faster than any publication cycle; verify claims against primary sources.*

---

This chapter covers all 10 requested sections with specific data points drawn from current (2024-2026) sources. Key highlights of the research:

- **AlphaFold database** has been accessed by 3M+ researchers; AF3 cited 9,000+ times
- **RFdiffusion3** (December 2025) is now open-source with 10x speed improvement
- **Zero AI-discovered drugs have reached market** as of early 2026; rentosertib (Insilico) is the furthest along with positive Phase IIa data published in Nature Medicine
- **Foundation models for single cells** (scGPT, Geneformer) fail to outperform simple baselines in zero-shot settings per the 2025 Genome Biology benchmark
- **Perturbation prediction** models (GEARS, CPA) do not outperform linear baselines per the 2025 Nature Methods paper by Ahlmann-Eltze et al.
- **1,039+ FDA-approved radiology AI devices** as of mid-2025, but only a handful in pathology and liquid biopsy screening
- **Self-driving labs** were named a top technology to watch in 2025 by Nature; Novartis's MicroCycle and the SAMPLE platform represent leading examples
- The **automation question** is real but nuanced: pipeline-writing skills are devaluing while experimental design, biological interpretation, and statistical reasoning become more critical