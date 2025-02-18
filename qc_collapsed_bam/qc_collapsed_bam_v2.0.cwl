class: Workflow
cwlVersion: v1.0
id: qc_collapsed_bam
doc: Calcualte Quality Control Metrics from All-Unique/Collapsed BAM
label: qc_collapsed_bam
$namespaces:
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference
    type: File
    secondaryFiles:
      - ^.fasta.fai
      - ^.dict
    'sbg:x': 0
    'sbg:y': 534.375
  - id: target_intervals
    type: File
    label: target_intervals
    'sbg:x': 0
    'sbg:y': 106.875
  - id: collapsed_bam
    type:
      - File
      - type: array
        items: File
    label: collapsed_bam
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 2351.25
  - id: group_reads_by_umi_bam
    type:
      - File
      - type: array
        items: File
    label: group_reads_by_umi_bam
    doc: Input BAM file generated by GroupReadByUmi.
    'sbg:x': 0
    'sbg:y': 1816.875
  - id: bait_intervals
    type: File?
    label: bait_intervals
    doc: 'Optional set of intervals over which to restrict analysis. [Optional].'
    'sbg:x': 0
    'sbg:y': 2565
  - id: json
    type: boolean?
    doc: Also output data in JSON format.
    'sbg:x': 0
    'sbg:y': 1389.375
  - id: plot
    type: boolean?
    doc: Also output plots of the data.
    'sbg:x': 0
    'sbg:y': 748.125
  - id: minor_threshold
    type: float?
    doc: Minor contamination threshold for bad sample.
    'sbg:x': 0
    'sbg:y': 961.875
  - id: coverage_threshold
    type: int?
    doc: Samples with Y chromosome above this value will be considered male.
    'sbg:x': 0
    'sbg:y': 2244.375
  - id: hsmetrics_minimum_mapping_quality
    type: int?
    'sbg:x': 0
    'sbg:y': 1496.25
  - id: hsmetrics_minimum_base_quality
    type: int?
    'sbg:x': 0
    'sbg:y': 1603.125
  - id: hsmetrics_coverage_cap
    type: int?
    'sbg:x': 0
    'sbg:y': 1710
  - id: prefix
    type: string?
    'sbg:x': 0
    'sbg:y': 641.25
  - id: major_threshold
    type: float?
    'sbg:x': 0
    'sbg:y': 1068.75
  - id: json_1
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1282.5
  - id: vcf_file
    type: File
    'sbg:x': 0
    'sbg:y': 0
  - id: sample_name
    type: string
    'sbg:x': 0
    'sbg:y': 320.625
  - id: sample_sex
    type: string?
    'sbg:x': 0
    'sbg:y': 213.75
  - id: sample_group
    type: string?
    'sbg:x': 0
    'sbg:y': 427.5
  - id: maf
    type: File
    'sbg:x': 0
    'sbg:y': 1175.625
  - id: bed_file
    type: File?
    'sbg:x': 0
    'sbg:y': 2458.125
  - id: omaf
    type: boolean?
    'sbg:x': 0
    'sbg:y': 855
  - id: filter_duplicate
    type: int
    'sbg:x': 0
    'sbg:y': 2137.5
  - id: fragment_count
    type: int
    'sbg:x': 0
    'sbg:y': 2030.625
  - id: generic_counting
    type: boolean?
    'sbg:x': 0
    'sbg:y': 1923.75
  - id: collapsed_biometrics_extract_file_type
    type: string?
    'sbg:x': 723.521240234375
    'sbg:y': 1204.8056640625
outputs:
  - id: fgbio_collect_duplex_seq_metrics_duplex_family_size
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_family_size
    type:
      - File
      - type: array
        items: File
    label: fgbio_collect_duplex_seq_metrics_duplex_family_size
    'sbg:x': 982.1435546875
    'sbg:y': 1526.125
  - id: fgbio_collect_duplex_seq_metrics_duplex_qc
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_qc
    type:
      - 'null'
      - File
      - type: array
        items: File
    label: fgbio_collect_duplex_seq_metrics_duplex_qc
    'sbg:x': 982.1435546875
    'sbg:y': 1419.25
  - id: fgbio_collect_duplex_seq_metrics_duplex
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_umi_counts
    type:
      - 'null'
      - File
      - type: array
        items: File
    label: fgbio_collect_duplex_seq_metrics_duplex
    'sbg:x': 982.1435546875
    'sbg:y': 1633
  - id: fgbio_collect_duplex_seq_metrics_duplex_yield_metrics
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_duplex_yield_metrics
    type:
      - File
      - type: array
        items: File
    label: fgbio_collect_duplex_seq_metrics_duplex_yield_metrics
    'sbg:x': 982.1435546875
    'sbg:y': 1312.375
  - id: fgbio_collect_duplex_seq_metrics_family_size
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_family_size
    type:
      - File
      - type: array
        items: File
    label: fgbio_collect_duplex_seq_metrics_family_size
    'sbg:x': 982.1435546875
    'sbg:y': 1205.5
  - id: fgbio_collect_duplex_seq_metrics_umi_counts
    outputSource:
      - >-
        fgbio_collect_duplex_seq_metrics_1_2_0/fgbio_collect_duplex_seq_metrics_umi_counts
    type:
      - File
      - type: array
        items: File
    label: fgbio_collect_duplex_seq_metrics_umi_counts
    'sbg:x': 982.1435546875
    'sbg:y': 1098.625
  - id: biometrics_minor_csv
    outputSource:
      - biometrics_minor/biometrics_minor_csv
    type:
      - File
      - type: array
        items: File
    'sbg:x': 1482.3623046875
    'sbg:y': 1389.375
  - id: biometrics_minor_json
    outputSource:
      - biometrics_minor/biometrics_minor_json
    type:
      - 'null'
      - File
      - type: array
        items: File
    'sbg:x': 1482.3623046875
    'sbg:y': 1282.5
  - id: biometrics_minor_plot
    outputSource:
      - biometrics_minor/biometrics_minor_plot
    type:
      - 'null'
      - File
      - type: array
        items: File
    'sbg:x': 1482.3623046875
    'sbg:y': 1175.625
  - id: biometrics_minor_sites_plot
    outputSource:
      - biometrics_minor/biometrics_minor_sites_plot
    type:
      - 'null'
      - File
      - type: array
        items: File
    'sbg:x': 1482.3623046875
    'sbg:y': 1068.75
  - id: biometrics_sexmismatch_json
    outputSource:
      - biometrics_sexmismatch/biometrics_sexmismatch_json
    type:
      - 'null'
      - File
      - type: array
        items: File
    'sbg:x': 1482.3623046875
    'sbg:y': 855
  - id: biometrics_sexmismatch_csv
    outputSource:
      - biometrics_sexmismatch/biometrics_sexmismatch_csv
    type:
      - File
      - type: array
        items: File
    'sbg:x': 1482.3623046875
    'sbg:y': 961.875
  - id: gatk_collect_insert_size_metrics_txt
    outputSource:
      - bam_qc_stats/gatk_collect_insert_size_metrics_txt
    type:
      - File
      - type: array
        items: File
    label: gatk_collect_insert_size_metrics_txt
    'sbg:x': 982.1435546875
    'sbg:y': 350.5
  - id: gatk_collect_insert_size_metrics_histogram_pdf
    outputSource:
      - bam_qc_stats/gatk_collect_insert_size_metrics_histogram_pdf
    type:
      - File
      - type: array
        items: File
    label: gatk_collect_insert_size_metrics_histogram_pdf
    'sbg:x': 982.1435546875
    'sbg:y': 457.375
  - id: gatk_collect_hs_metrics_txt
    outputSource:
      - bam_qc_stats/gatk_collect_hs_metrics_txt
    type:
      - File
      - type: array
        items: File
    label: gatk_collect_hs_metrics_txt
    'sbg:x': 982.1435546875
    'sbg:y': 564.25
  - id: gatk_collect_hs_metrics_per_target_coverage_txt
    outputSource:
      - bam_qc_stats/gatk_collect_hs_metrics_per_target_coverage_txt
    type:
      - File
      - type: array
        items: File
    label: gatk_collect_hs_metrics_per_target_coverage_txt
    'sbg:x': 982.1435546875
    'sbg:y': 671.125
  - id: gatk_collect_hs_metrics_per_base_coverage_txt
    outputSource:
      - bam_qc_stats/gatk_collect_hs_metrics_per_base_coverage_txt
    type:
      - File
      - type: array
        items: File
    label: gatk_collect_hs_metrics_per_base_coverage_txt
    'sbg:x': 982.1435546875
    'sbg:y': 778
  - id: gatk_collect_alignment_summary_metrics_txt
    outputSource:
      - bam_qc_stats/gatk_collect_alignment_summary_metrics_txt
    type:
      - File
      - type: array
        items: File
    label: gatk_collect_alignment_summary_metrics_txt
    'sbg:x': 982.1435546875
    'sbg:y': 884.875
  - id: biometrics_major_plot
    outputSource:
      - biometrics_major_0_2_13/biometrics_major_plot
    type: File?
    'sbg:x': 1482.3623046875
    'sbg:y': 1496.25
  - id: biometrics_major_json
    outputSource:
      - biometrics_major_0_2_13/biometrics_major_json
    type: File?
    'sbg:x': 1482.3623046875
    'sbg:y': 1603.125
  - id: biometrics_major_csv
    outputSource:
      - biometrics_major_0_2_13/biometrics_major_csv
    type: File
    'sbg:x': 1482.3623046875
    'sbg:y': 1710
  - id: biometrics_extract_pickle
    outputSource:
      - biometrics_extract_0_2_13/biometrics_extract_pickle
    type: File
    'sbg:x': 982.1435546875
    'sbg:y': 2214.5
  - id: fillout_maf
    outputSource:
      - getbasecountsmultisample_1_2_5/fillout
    type: File
    'sbg:x': 982.1435546875
    'sbg:y': 991.75
steps:
  - id: bam_qc_stats
    in:
      - id: input
        source:
          - collapsed_bam
      - id: target_intervals
        source: target_intervals
      - id: bait_intervals
        source: bait_intervals
      - id: reference
        source: reference
      - id: hsmetrics_minimum_mapping_quality
        source: hsmetrics_minimum_mapping_quality
      - id: hsmetrics_minimum_base_quality
        source: hsmetrics_minimum_base_quality
      - id: hsmetrics_coverage_cap
        source: hsmetrics_coverage_cap
    out:
      - id: gatk_collect_insert_size_metrics_histogram_pdf
      - id: gatk_collect_insert_size_metrics_txt
      - id: gatk_collect_hs_metrics_txt
      - id: gatk_collect_hs_metrics_per_base_coverage_txt
      - id: gatk_collect_hs_metrics_per_target_coverage_txt
      - id: gatk_collect_alignment_summary_metrics_txt
    run: ../bam_qc_stats/bam_qc_stats.cwl
    label: bam_qc_stats
    'sbg:x': 351.4375
    'sbg:y': 1519.8125
  - id: fgbio_collect_duplex_seq_metrics_1_2_0
    in:
      - id: input
        source: group_reads_by_umi_bam
      - id: intervals
        source: bait_intervals
    out:
      - id: fgbio_collect_duplex_seq_metrics_family_size
      - id: fgbio_collect_duplex_seq_metrics_duplex_family_size
      - id: fgbio_collect_duplex_seq_metrics_duplex_yield_metrics
      - id: fgbio_collect_duplex_seq_metrics_umi_counts
      - id: fgbio_collect_duplex_seq_metrics_duplex_qc
      - id: fgbio_collect_duplex_seq_metrics_duplex_umi_counts
    run: >-
      ../command_line_tools/fgbio_collect_duplex_seq_metrics_1.2.0/fgbio_collect_duplex_seq_metrics_1.2.0.cwl
    label: fgbio_collect_duplex_seq_metrics_1.2.0
    'sbg:x': 351.4375
    'sbg:y': 1145.0625
  - id: biometrics_minor
    in:
      - id: input
        linkMerge: merge_nested
        source:
          - biometrics_extract_0_2_13/biometrics_extract_pickle
      - id: minor_threshold
        source: minor_threshold
      - id: prefix
        default: collapsed
        source: prefix
      - id: plot
        default: false
        source: plot
      - id: json
        default: true
        source: json
    out:
      - id: biometrics_minor_csv
      - id: biometrics_minor_json
      - id: biometrics_minor_plot
      - id: biometrics_minor_sites_plot
    run: ../command_line_tools/biometrics_minor/0.2.13/biometrics_minor.cwl
    'sbg:x': 982.1435546875
    'sbg:y': 1916.75
  - id: biometrics_sexmismatch
    in:
      - id: input
        linkMerge: merge_flattened
        source:
          - biometrics_extract_0_2_13/biometrics_extract_pickle
      - id: coverage_threshold
        source: coverage_threshold
      - id: prefix
        default: collapsed
        source: prefix
      - id: json
        source: json
    out:
      - id: biometrics_sexmismatch_csv
      - id: biometrics_sexmismatch_json
    run: >-
      ../command_line_tools/biometrics_sexmismatch/0.2.13/biometrics_sexmismatch.cwl
    'sbg:x': 982.1435546875
    'sbg:y': 1760.875
  - id: biometrics_major_0_2_13
    in:
      - id: input
        linkMerge: merge_nested
        source:
          - biometrics_extract_0_2_13/biometrics_extract_pickle
      - id: major_threshold
        source: major_threshold
      - id: prefix
        source: prefix
      - id: plot
        source: plot
      - id: json
        source: json_1
    out:
      - id: biometrics_major_csv
      - id: biometrics_major_json
      - id: biometrics_major_plot
    run: ../command_line_tools/biometrics_major/0.2.13/biometrics_major.cwl
    'sbg:x': 982.1435546875
    'sbg:y': 2079.625
  - id: biometrics_extract_0_2_13
    in:
      - id: sample_bam
        source: collapsed_bam
      - id: sample_sex
        source: sample_sex
      - id: sample_group
        source: sample_group
      - id: sample_name
        source: sample_name
      - id: fafile
        source: reference
      - id: vcf_file
        source: vcf_file
      - id: bed_file
        source: bed_file
      - id: file_type
        default: collapsed
        source: collapsed_biometrics_extract_file_type
    out:
      - id: biometrics_extract_pickle
    run: ../command_line_tools/biometrics_extract/0.2.13/biometrics_extract.cwl
    'sbg:x': 351.4375
    'sbg:y': 1328.9375
  - id: getbasecountsmultisample_1_2_5
    in:
      - id: genotyping_bams
        source:
          - collapsed_bam
      - id: genotyping_bams_ids
        source:
          - sample_name
      - id: filter_duplicate
        default: 0
        source: filter_duplicate
      - id: fragment_count
        default: 1
        source: fragment_count
      - id: maf
        source: maf
      - id: maq
        source: hsmetrics_minimum_mapping_quality
      - id: omaf
        source: omaf
      - id: output
        source: sample_name
        valueFrom: $(self + '_collapsed_hotspots_fillout.maf')
      - id: ref_fasta
        source: reference
      - id: generic_counting
        source: generic_counting
    out:
      - id: fillout
    run: >-
      ../command_line_tools/getbasecountsmultisample/1.2.5/getbasecountsmultisample_1.2.5.cwl
    label: getbasecountsmultisample_1.2.5
    'sbg:x': 351.4375
    'sbg:y': 940.1875
requirements:
  - class: SubworkflowFeatureRequirement
$schemas:
  - 'http://schema.org/version/latest/schemaorg-current-http.rdf'
's:author':
  - class: 's:Person'
    's:email': 'mailto:charalk@mskcc.org'
    's:identifier': ''
    's:name': Carmelina Charalambous
's:citation': ''
's:codeRepository': 'https://github.com/msk-access/uncollapsed_bam_generation'
's:contributor':
  - class: 's:Person'
    's:email': 'mailto:shahr2@mskcc.org'
    's:identifier': 'https://orcid.org/0000-0001-9042-6213'
    's:name': Ronak Shah
's:dateCreated': '2022-03-23'
's:license': 'https://spdx.org/licenses/Apache-2.0'
