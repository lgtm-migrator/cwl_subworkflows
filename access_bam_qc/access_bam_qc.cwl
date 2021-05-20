class: Workflow
cwlVersion: v1.0
id: access_bam_qc
label: access_bam_qc
$namespaces:
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference
    type: File
    secondaryFiles:
      - ^.fasta.fai
      - ^.dict
    'sbg:x': -1367.075439453125
    'sbg:y': -170.63369750976562
  - id: duplex_bam
    type: 'File[]'
    label: duplex_bam
    secondaryFiles:
      - ^.bai
    'sbg:x': -808.21337890625
    'sbg:y': -258.8006591796875
  - id: collapsed_bam
    type: 'File[]'
    label: collapsed_bam
    secondaryFiles:
      - ^.bai
    'sbg:x': -810.0906372070312
    'sbg:y': -123.79762268066406
  - id: group_reads_by_umi_bam
    type: 'File[]'
    label: group_reads_by_umi_bam
    doc: Input BAM file generated by GroupReadByUmi.
    'sbg:x': -811.8580322265625
    'sbg:y': 27.081497192382812
  - id: uncollapsed_bam
    type: 'File[]'
    label: uncollapsed_bam
    secondaryFiles:
      - ^.bai
    'sbg:x': -810.2417602539062
    'sbg:y': 164.8699493408203
  - id: uncollapsed_bam_base_recal
    type: 'File[]'
    label: uncollapsed_bam_base_recal
    doc: An aligned SAM or BAM file.  Required.
    secondaryFiles:
      - ^.bai
    'sbg:x': -813.2417602539062
    'sbg:y': 310.27471923828125
  - id: pool_b_target_intervals
    type: File
    label: pool_b_target_intervals
    'sbg:x': -1362.9149169921875
    'sbg:y': 304.2558288574219
  - id: pool_b_bait_intervals
    type: File
    label: pool_b_bait_intervals
    'sbg:x': -1362.1119384765625
    'sbg:y': 466.5614929199219
  - id: pool_a_target_intervals
    type: File
    label: pool_a_target_intervals
    'sbg:x': -1358.999755859375
    'sbg:y': -23.60011863708496
  - id: pool_a_bait_intervals
    type: File
    label: pool_a_bait_intervals
    'sbg:x': -1366.56494140625
    'sbg:y': 126.96497344970703
  - id: biometrics_bed_file
    type: File?
    doc: BED file containing the intervals to be queried.
    'sbg:x': -1356.0794677734375
    'sbg:y': 652.2377319335938
  - id: biometrics_vcf_file
    type: File
    doc: VCF file containing the SNPs to be queried.
    'sbg:x': -1345.8929443359375
    'sbg:y': 834.68603515625
  - id: noise_sites_bed
    type: File
    label: noise_sites_bed
    doc: >-
      Path to BED file containing regions over which to calculate noise
      [required]
    'sbg:x': -1351.35888671875
    'sbg:y': 982.7118530273438
  - id: sample_type
    type: 'string[]?'
    doc: 'Sample types: Normal or Tumor.'
    'sbg:x': -820.0021362304688
    'sbg:y': -904.2953491210938
  - id: sample_sex
    type: 'string[]?'
    doc: Expected sample sex (i.e. M or F).
    'sbg:x': -811.90576171875
    'sbg:y': -766.7771606445312
  - id: sample_name
    type: 'string[]'
    doc: >-
      Sample name. If not specified, sample name is automatically figured out
      from the BAM file.
    'sbg:x': -807.0020751953125
    'sbg:y': -645.0062255859375
  - id: sample_group
    type: 'string[]'
    doc: The sample group (e.g. the sample patient ID).
    'sbg:x': -813.4239501953125
    'sbg:y': -524.909912109375
  - id: simplex_bam
    type: 'File[]'
    label: simplex_bam
    secondaryFiles:
      - ^.bai
    'sbg:x': -809.8264770507812
    'sbg:y': -383.9412536621094
  - id: biometrics_plot
    type: boolean?
    label: biometrics_plot
    doc: Also output plots of the data.
    'sbg:x': -1379.9268798828125
    'sbg:y': -906.622314453125
  - id: duplex_biometrics_minor_threshold
    type: float?
    label: duplex_biometrics_minor_threshold
    doc: Minor contamination threshold for bad sample.
    'sbg:x': -1403.07958984375
    'sbg:y': -1674.0557861328125
  - id: duplex_biometrics_min_mapping_quality
    type: int?
    label: duplex_biometrics_min_mapping_quality
    doc: Minimum mapping quality of reads to be used for pileup.
    'sbg:x': -1396.1343994140625
    'sbg:y': -1554.8912353515625
  - id: duplex_biometrics_min_homozygous_thresh
    type: float?
    label: duplex_biometrics_min_homozygous_thresh
    doc: Minimum threshold to define homozygous.
    'sbg:x': -1385.1710205078125
    'sbg:y': -1427.8912353515625
  - id: duplex_biometrics_min_coverage
    type: int?
    label: duplex_biometrics_min_coverage
    doc: Minimum coverage to count a site.
    'sbg:x': -1388.2076416015625
    'sbg:y': -1303.781494140625
  - id: duplex_biometrics_min_base_quality
    type: int?
    label: duplex_biometrics_min_base_quality
    doc: Minimum base quality of reads to be used for pileup.
    'sbg:x': -1384.262451171875
    'sbg:y': -1172.6351318359375
  - id: duplex_biometrics_major_threshold
    type: float?
    label: duplex_biometrics_major_threshold
    doc: Major contamination threshold for bad sample.
    'sbg:x': -1390.1893310546875
    'sbg:y': -1050.3974609375
  - id: biometrics_json
    type: boolean?
    label: biometrics_json
    doc: Also output data in JSON format.
    'sbg:x': -1376.9451904296875
    'sbg:y': -753.5125732421875
  - id: collapsed_biometrics_minor_threshold
    type: float?
    label: collapsed_biometrics_minor_threshold
    doc: Minor contamination threshold for bad sample.
    'sbg:x': -838.6036376953125
    'sbg:y': -2211.296142578125
  - id: collapsed_biometrics_min_mapping_quality
    type: int?
    label: collapsed_biometrics_min_mapping_quality
    doc: Minimum mapping quality of reads to be used for pileup.
    'sbg:x': -842.24755859375
    'sbg:y': -2087.296142578125
  - id: collapsed_biometrics_min_homozygous_thresh
    type: float?
    label: collapsed_biometrics_min_homozygous_thresh
    doc: Minimum threshold to define homozygous.
    'sbg:x': -838.9255981445312
    'sbg:y': -1947.6180419921875
  - id: collapsed_biometrics_min_coverage
    type: int?
    label: collapsed_biometrics_min_coverage
    doc: Minimum coverage to count a site.
    'sbg:x': -833.9255981445312
    'sbg:y': -1817.9400634765625
  - id: collapsed_biometrics_min_base_quality
    type: int?
    label: collapsed_biometrics_min_base_quality
    doc: Minimum base quality of reads to be used for pileup.
    'sbg:x': -835.4125366210938
    'sbg:y': -1676.795166015625
  - id: collapsed_biometrics_major_threshold
    type: float?
    label: collapsed_biometrics_major_threshold
    doc: Major contamination threshold for bad sample.
    'sbg:x': -839.7344970703125
    'sbg:y': -1520.1512451171875
  - id: collapsed_biometrics_coverage_threshold
    type: int?
    label: collapsed_biometrics_coverage_threshold
    doc: Samples with Y chromosome above this value will be considered male.
    'sbg:x': -830.3240356445312
    'sbg:y': -1386.815185546875
outputs:
  - id: uncollapsed_bam_stats_pool_a_dir
    outputSource:
      - uncollapsed_bam_stats_pool_a/directory
    type: Directory
    label: uncollapsed_bam_stats_pool_a_dir
    'sbg:x': 936.3370971679688
    'sbg:y': 1276.5693359375
  - id: uncollapsed_bam_stats_pool_b_dir
    outputSource:
      - uncollapsed_bam_stats_pool_b/directory
    type: Directory
    label: uncollapsed_bam_stats_pool_b_dir
    'sbg:x': 938.3370971679688
    'sbg:y': 1104.712890625
  - id: gatk_mean_quality_by_cycle_dir
    outputSource:
      - gatk_mean_quality_by_cycle/directory
    type: Directory
    label: gatk_mean_quality_by_cycle_dir
    'sbg:x': 942.054931640625
    'sbg:y': 969.8564453125
  - id: gatk_mean_quality_by_cycle_recal_dir
    outputSource:
      - gatk_mean_quality_by_cycle_recal/directory
    type: Directory
    label: gatk_mean_quality_by_cycle_recal_dir
    'sbg:x': 926.4806518554688
    'sbg:y': 829.7128295898438
  - id: collapsed_bam_biometrics_dir
    outputSource:
      - collapsed_bam_biometrics/directory
    type: Directory
    label: collapsed_bam_biometrics_dir
    'sbg:x': 1134.9063720703125
    'sbg:y': 399.7128601074219
  - id: collapsed_bam_duplex_metrics_pool_b_dir
    outputSource:
      - collapsed_bam_duplex_metrics_pool_b/directory
    type: Directory
    label: collapsed_bam_duplex_metrics_pool_b_dir
    'sbg:x': 1145.767822265625
    'sbg:y': 271
  - id: collapsed_bam_duplex_metrics_pool_a_dir
    outputSource:
      - collapsed_bam_duplex_metrics_pool_a/directory
    type: Directory
    label: collapsed_bam_duplex_metrics_pool_a_dir
    'sbg:x': 1166.6292724609375
    'sbg:y': 141.14356994628906
  - id: collapsed_bam_stats_pool_b_dir
    outputSource:
      - collapsed_bam_stats_pool_b/directory
    type: Directory
    label: collapsed_bam_stats_pool_b_dir
    'sbg:x': 1170.485595703125
    'sbg:y': 15
  - id: collapsed_bam_stats_pool_a_dir
    outputSource:
      - collapsed_bam_stats_pool_a/directory
    type: Directory
    label: collapsed_bam_stats_pool_a_dir
    'sbg:x': 1160.911376953125
    'sbg:y': -114.71286010742188
  - id: simplex_bam_pool_a_dir
    outputSource:
      - simplex_bam_pool_a/directory
    type: Directory
    label: simplex_bam_pool_a_dir
    'sbg:x': 683.2476806640625
    'sbg:y': -1022.0474853515625
  - id: simplex_bam_pool_b_dir
    outputSource:
      - simplex_bam_pool_b/directory
    type: Directory
    label: simplex_bam_pool_b_dir
    'sbg:x': 684.8497924804688
    'sbg:y': -855.4249267578125
  - id: duplex_bam_sequence_qc_dir
    outputSource:
      - duplex_bam_sequence_qc/directory
    type: Directory
    label: duplex_bam_sequence_qc_dir
    'sbg:x': 729.1605224609375
    'sbg:y': -713.2938842773438
  - id: duplex_bam_stats_pool_a_dir
    outputSource:
      - duplex_bam_stats_pool_a/directory
    type: Directory
    label: duplex_bam_stats_pool_a_dir
    'sbg:x': 733.3512573242188
    'sbg:y': -600.1427001953125
  - id: duplex_bam_stats_pool_b_dir
    outputSource:
      - duplex_bam_stats_pool_b/directory
    type: Directory
    label: duplex_bam_stats_pool_b_dir
    'sbg:x': 738.5897827148438
    'sbg:y': -483.848388671875
  - id: duplex_bam_biometrics_dir
    outputSource:
      - duplex_bam_biometrics/directory
    type: Directory
    label: duplex_bam_biometrics_dir
    'sbg:x': 745.9236450195312
    'sbg:y': -362.3155822753906
steps:
  - id: qc_collapsed_bam
    in:
      - id: reference
        source: reference
      - id: pool_b_target_intervals
        source: pool_b_target_intervals
      - id: pool_a_target_intervals
        source: pool_a_target_intervals
      - id: biometrics_vcf_file
        source: biometrics_vcf_file
      - id: collapsed_bam
        source:
          - collapsed_bam
      - id: sample_type
        source:
          - sample_type
      - id: sample_sex
        source:
          - sample_sex
      - id: sample_name
        source:
          - sample_name
      - id: sample_group
        source:
          - sample_group
      - id: group_reads_by_umi_bam
        source:
          - group_reads_by_umi_bam
      - id: pool_a_bait_intervals
        source: pool_a_bait_intervals
      - id: pool_b_bait_intervals
        source: pool_b_bait_intervals
      - id: biometrics_bed_file
        source: biometrics_bed_file
      - id: json
        source: biometrics_json
      - id: plot
        source: biometrics_plot
      - id: major_threshold
        source: collapsed_biometrics_major_threshold
      - id: minor_threshold
        source: collapsed_biometrics_minor_threshold
      - id: coverage_threshold
        source: collapsed_biometrics_coverage_threshold
      - id: min_mapping_quality
        source: collapsed_biometrics_min_mapping_quality
      - id: min_homozygous_thresh
        source: collapsed_biometrics_min_homozygous_thresh
      - id: min_coverage
        source: collapsed_biometrics_min_coverage
      - id: min_base_quality
        source: collapsed_biometrics_min_base_quality
    out:
      - id: biometrics_extract_pickle
      - id: fgbio_collect_duplex_seq_metrics_duplex_family_size_pool_a
      - id: fgbio_collect_duplex_seq_metrics_duplex_qc_pool_a
      - id: fgbio_collect_duplex_seq_metrics_duplex_pool_a
      - id: fgbio_collect_duplex_seq_metrics_duplex_yield_metrics_pool_a
      - id: fgbio_collect_duplex_seq_metrics_family_size_pool_a
      - id: fgbio_collect_duplex_seq_metrics_umi_counts_pool_a
      - id: fgbio_collect_duplex_seq_metrics_duplex_family_size_pool_b
      - id: fgbio_collect_duplex_seq_metrics_duplex_qc_pool_b
      - id: fgbio_collect_duplex_seq_metrics_duplex_umi_counts_pool_b
      - id: fgbio_collect_duplex_seq_metrics_duplex_yield_metrics_pool_b
      - id: fgbio_collect_duplex_seq_metrics_family_size_pool_b
      - id: fgbio_collect_duplex_seq_metrics_umi_counts_pool_b
      - id: biometrics_minor_csv
      - id: biometrics_minor_json
      - id: biometrics_minor_plot
      - id: biometrics_minor_sites_plot
      - id: biometrics_major_csv
      - id: biometrics_major_json
      - id: biometrics_major_plot
      - id: biometrics_sexmismatch_json
      - id: biometrics_sexmismatch_csv
      - id: gatk_collect_insert_size_metrics_txt_pool_b
      - id: gatk_collect_insert_size_metrics_histogram_pdf_pool_b
      - id: gatk_collect_hs_metrics_txt_pool_b
      - id: gatk_collect_hs_metrics_per_target_coverage_txt_pool_b
      - id: gatk_collect_hs_metrics_per_base_coverage_txt_pool_b
      - id: gatk_collect_alignment_summary_metrics_txt_pool_b
      - id: gatk_collect_insert_size_metrics_txt_pool_a
      - id: gatk_collect_insert_size_metrics_histogram_pdf_pool_a
      - id: gatk_collect_hs_metrics_txt_pool_a
      - id: gatk_collect_hs_metrics_per_target_coverage_txt_pool_a
      - id: gatk_collect_hs_metrics_per_base_coverage_txt_pool_a
      - id: gatk_collect_alignment_summary_metrics_txt_pool_a
    run: ../qc_collapsed_bam/qc_collapsed_bam.cwl
    label: qc_collapsed_bam
    scatter:
      - collapsed_bam
      - sample_type
      - sample_sex
      - sample_name
      - sample_group
      - group_reads_by_umi_bam
    scatterMethod: dotproduct
    'sbg:x': -98.75630187988281
    'sbg:y': 269.2268981933594
  - id: qc_uncollapsed_bam
    in:
      - id: reference
        source: reference
      - id: uncollapsed_bam
        source:
          - uncollapsed_bam
      - id: uncollapsed_bam_base_recal
        source:
          - uncollapsed_bam_base_recal
      - id: pool_b_target_intervals
        source: pool_b_target_intervals
      - id: pool_b_bait_intervals
        source: pool_b_bait_intervals
      - id: pool_a_bait_intervals
        source: pool_a_bait_intervals
      - id: pool_a_target_intervals
        source: pool_a_target_intervals
    out:
      - id: gatk_collect_alignment_summary_metrics_txt_pool_b
      - id: gatk_collect_hs_metrics_per_base_coverage_txt_pool_b
      - id: gatk_collect_hs_metrics_per_target_coverage_txt_pool_b
      - id: gatk_collect_hs_metrics_txt_pool_b
      - id: gatk_collect_insert_size_metrics_histogram_pdf_pool_b
      - id: gatk_collect_insert_size_metrics_txt_pool_b
      - id: gatk_collect_alignment_summary_metrics_txt_pool_a
      - id: gatk_collect_hs_metrics_per_base_coverage_txt_pool_a
      - id: gatk_collect_hs_metrics_per_target_coverage_txt_pool_a
      - id: gatk_collect_hs_metrics_txt_pool_a
      - id: gatk_collect_insert_size_metrics_histogram_pdf_pool_a
      - id: gatk_collect_insert_size_metrics_txt_pool_a
      - id: gatk_mean_quality_by_cycle_output
      - id: gatk_mean_quality_by_cycle_chart_output
      - id: gatk_mean_quality_by_cycle_output_base_recal
      - id: gatk_mean_quality_by_cycle_chart_output_base_recal
    run: ../qc_uncollapsed_bam/qc_uncollapsed_bam.cwl
    label: qc_uncollapsed_bam
    scatter:
      - uncollapsed_bam
      - uncollapsed_bam_base_recal
    scatterMethod: dotproduct
    'sbg:x': -77.46428680419922
    'sbg:y': 1069.7781982421875
  - id: qc_duplex_bam
    in:
      - id: reference
        source: reference
      - id: duplex_bam
        source:
          - duplex_bam
      - id: pool_a_target_intervals
        source: pool_a_target_intervals
      - id: pool_a_bait_intervals
        source: pool_a_bait_intervals
      - id: pool_b_target_intervals
        source: pool_b_target_intervals
      - id: pool_b_bait_intervals
        source: pool_b_bait_intervals
      - id: noise_sites_bed
        source: noise_sites_bed
      - id: biometrics_vcf_file
        source: biometrics_vcf_file
      - id: sample_type
        source:
          - sample_type
      - id: sample_sex
        source:
          - sample_sex
      - id: sample_name
        source:
          - sample_name
      - id: sample_group
        source:
          - sample_group
      - id: min_mapping_quality
        source: duplex_biometrics_min_mapping_quality
      - id: min_homozygous_thresh
        source: duplex_biometrics_min_homozygous_thresh
      - id: min_coverage
        source: duplex_biometrics_min_coverage
      - id: min_base_quality
        source: duplex_biometrics_min_base_quality
      - id: plot
        source: biometrics_plot
      - id: major_threshold
        source: duplex_biometrics_major_threshold
      - id: minor_threshold
        source: duplex_biometrics_minor_threshold
      - id: json
        source: biometrics_json
    out:
      - id: biometrics_minor_csv
      - id: biometrics_minor_plot
      - id: biometrics_minor_json
      - id: biometrics_minor_sites_plot
      - id: biometrics_major_csv
      - id: biometrics_major_json
      - id: biometrics_major_plot
      - id: sequence_qc_noise_positions
      - id: sequence_qc_noise_n
      - id: sequence_qc_noise_del
      - id: sequence_qc_noise_acgt
      - id: sequence_qc_figures
      - id: biometrics_extract_pickle
      - id: gatk_collect_alignment_summary_metrics_txt_pool_b
      - id: gatk_collect_hs_metrics_per_base_coverage_txt_pool_b
      - id: gatk_collect_hs_metrics_per_target_coverage_txt_pool_b
      - id: gatk_collect_hs_metrics_txt_pool_b
      - id: gatk_collect_insert_size_metrics_histogram_pdf_pool_b
      - id: gatk_collect_insert_size_metrics_txt_pool_b
      - id: gatk_collect_alignment_summary_metrics_txt_pool_a
      - id: gatk_collect_hs_metrics_per_base_coverage_txt_pool_a
      - id: gatk_collect_hs_metrics_per_target_coverage_txt_pool_a
      - id: gatk_collect_hs_metrics_txt_pool_a
      - id: gatk_collect_insert_size_metrics_histogram_pdf_pool_a
      - id: gatk_collect_insert_size_metrics_txt_pool_a
    run: ../qc_duplex_bam/qc_duplex_bam.cwl
    label: qc_duplex_bam
    scatter:
      - duplex_bam
      - sample_type
      - sample_sex
      - sample_name
      - sample_group
    scatterMethod: dotproduct
    'sbg:x': -111.68614196777344
    'sbg:y': -453
  - id: simplex_bam_pool_a
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_simplex_bam/gatk_collect_insert_size_metrics_txt_pool_a
          - qc_simplex_bam/gatk_collect_insert_size_metrics_histogram_pdf_pool_a
          - qc_simplex_bam/gatk_collect_hs_metrics_txt_pool_a
          - >-
            qc_simplex_bam/gatk_collect_hs_metrics_per_target_coverage_txt_pool_a
          - qc_simplex_bam/gatk_collect_hs_metrics_per_base_coverage_txt_pool_a
          - qc_simplex_bam/gatk_collect_alignment_summary_metrics_txt_pool_a
      - id: output_directory_name
        default: simplex_bam_pool_a
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: simplex_bam_pool_a
    'sbg:x': 439.89935302734375
    'sbg:y': -1027.125244140625
  - id: simplex_bam_pool_b
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_simplex_bam/gatk_collect_insert_size_metrics_txt_pool_b
          - qc_simplex_bam/gatk_collect_insert_size_metrics_histogram_pdf_pool_b
          - qc_simplex_bam/gatk_collect_hs_metrics_txt_pool_b
          - >-
            qc_simplex_bam/gatk_collect_hs_metrics_per_target_coverage_txt_pool_b
          - qc_simplex_bam/gatk_collect_hs_metrics_per_base_coverage_txt_pool_b
          - qc_simplex_bam/gatk_collect_alignment_summary_metrics_txt_pool_b
      - id: output_directory_name
        default: simplex_bam_pool_b
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: simplex_bam_pool_b
    'sbg:x': 441.774169921875
    'sbg:y': -861.6499633789062
  - id: uncollapsed_bam_stats_pool_b
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_uncollapsed_bam/gatk_collect_alignment_summary_metrics_txt_pool_b
          - >-
            qc_uncollapsed_bam/gatk_collect_hs_metrics_per_base_coverage_txt_pool_b
          - >-
            qc_uncollapsed_bam/gatk_collect_hs_metrics_per_target_coverage_txt_pool_b
          - qc_uncollapsed_bam/gatk_collect_hs_metrics_txt_pool_b
          - >-
            qc_uncollapsed_bam/gatk_collect_insert_size_metrics_histogram_pdf_pool_b
          - qc_uncollapsed_bam/gatk_collect_insert_size_metrics_txt_pool_b
      - id: output_directory_name
        default: uncollapsed_bam_stats_pool_b
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: uncollapsed_bam_stats_pool_b
    'sbg:x': 395.6892395019531
    'sbg:y': 1122.4478759765625
  - id: uncollapsed_bam_stats_pool_a
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_uncollapsed_bam/gatk_collect_alignment_summary_metrics_txt_pool_a
          - >-
            qc_uncollapsed_bam/gatk_collect_hs_metrics_per_base_coverage_txt_pool_a
          - >-
            qc_uncollapsed_bam/gatk_collect_hs_metrics_per_target_coverage_txt_pool_a
          - qc_uncollapsed_bam/gatk_collect_hs_metrics_txt_pool_a
          - >-
            qc_uncollapsed_bam/gatk_collect_insert_size_metrics_histogram_pdf_pool_a
          - qc_uncollapsed_bam/gatk_collect_insert_size_metrics_txt_pool_a
      - id: output_directory_name
        default: uncollapsed_bam_stats_pool_a
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: uncollapsed_bam_stats_pool_a
    'sbg:x': 402.8958740234375
    'sbg:y': 1272.7586669921875
  - id: gatk_mean_quality_by_cycle
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_uncollapsed_bam/gatk_mean_quality_by_cycle_chart_output
          - qc_uncollapsed_bam/gatk_mean_quality_by_cycle_output
      - id: output_directory_name
        default: gatk_mean_quality_by_cycle
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: gatk_mean_quality_by_cycle
    'sbg:x': 403.6803283691406
    'sbg:y': 975.385986328125
  - id: gatk_mean_quality_by_cycle_recal
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - >-
            qc_uncollapsed_bam/gatk_mean_quality_by_cycle_chart_output_base_recal
          - qc_uncollapsed_bam/gatk_mean_quality_by_cycle_output_base_recal
      - id: output_directory_name
        default: gatk_mean_quality_by_cycle_recal
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: gatk_mean_quality_by_cycle_recal
    'sbg:x': 403.2690124511719
    'sbg:y': 829.990234375
  - id: collapsed_bam_stats_pool_a
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_collapsed_bam/gatk_collect_insert_size_metrics_txt_pool_a
          - >-
            qc_collapsed_bam/gatk_collect_insert_size_metrics_histogram_pdf_pool_a
          - qc_collapsed_bam/gatk_collect_hs_metrics_txt_pool_a
          - >-
            qc_collapsed_bam/gatk_collect_hs_metrics_per_target_coverage_txt_pool_a
          - >-
            qc_collapsed_bam/gatk_collect_hs_metrics_per_base_coverage_txt_pool_a
          - qc_collapsed_bam/gatk_collect_alignment_summary_metrics_txt_pool_a
      - id: output_directory_name
        default: collapsed_bam_stats_pool_a
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: collapsed_bam_stats_pool_a
    'sbg:x': 693.8934326171875
    'sbg:y': -116.73040008544922
  - id: collapsed_bam_stats_pool_b
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_collapsed_bam/gatk_collect_insert_size_metrics_txt_pool_b
          - >-
            qc_collapsed_bam/gatk_collect_insert_size_metrics_histogram_pdf_pool_b
          - qc_collapsed_bam/gatk_collect_hs_metrics_txt_pool_b
          - >-
            qc_collapsed_bam/gatk_collect_hs_metrics_per_target_coverage_txt_pool_b
          - >-
            qc_collapsed_bam/gatk_collect_hs_metrics_per_base_coverage_txt_pool_b
          - qc_collapsed_bam/gatk_collect_alignment_summary_metrics_txt_pool_b
      - id: output_directory_name
        default: collapsed_bam_stats_pool_b
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: collapsed_bam_stats_pool_b
    'sbg:x': 693
    'sbg:y': 13.673991203308105
  - id: collapsed_bam_duplex_metrics_pool_a
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_umi_counts_pool_a
          - qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_family_size_pool_a
          - >-
            qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_duplex_yield_metrics_pool_a
          - qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_duplex_qc_pool_a
          - qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_duplex_pool_a
          - >-
            qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_duplex_family_size_pool_a
      - id: output_directory_name
        default: collapsed_bam_duplex_metrics_pool_a
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: collapsed_bam_duplex_metrics_pool_a
    'sbg:x': 690.4910278320312
    'sbg:y': 137.0360565185547
  - id: collapsed_bam_duplex_metrics_pool_b
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_umi_counts_pool_b
          - qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_family_size_pool_b
          - >-
            qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_duplex_yield_metrics_pool_b
          - >-
            qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_duplex_umi_counts_pool_b
          - qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_duplex_qc_pool_b
          - >-
            qc_collapsed_bam/fgbio_collect_duplex_seq_metrics_duplex_family_size_pool_b
      - id: output_directory_name
        default: collapsed_bam_duplex_metrics_pool_b
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: collapsed_bam_duplex_metrics_pool_b
    'sbg:x': 686.7992553710938
    'sbg:y': 265.29779052734375
  - id: collapsed_bam_biometrics
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_collapsed_bam/biometrics_sexmismatch_json
          - qc_collapsed_bam/biometrics_sexmismatch_csv
          - qc_collapsed_bam/biometrics_minor_sites_plot
          - qc_collapsed_bam/biometrics_minor_plot
          - qc_collapsed_bam/biometrics_minor_json
          - qc_collapsed_bam/biometrics_minor_csv
          - qc_collapsed_bam/biometrics_major_plot
          - qc_collapsed_bam/biometrics_major_json
          - qc_collapsed_bam/biometrics_major_csv
          - qc_collapsed_bam/biometrics_extract_pickle
      - id: output_directory_name
        default: collapsed_bam_biometrics
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: collapsed_bam_biometrics
    'sbg:x': 682.2883911132812
    'sbg:y': 410.1722412109375
  - id: duplex_bam_sequence_qc
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_duplex_bam/sequence_qc_noise_positions
          - qc_duplex_bam/sequence_qc_noise_n
          - qc_duplex_bam/sequence_qc_noise_del
          - qc_duplex_bam/sequence_qc_noise_acgt
          - qc_duplex_bam/sequence_qc_figures
      - id: output_directory_name
        default: duplex_bam_sequence_qc
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: duplex_bam_sequence_qc
    'sbg:x': 530.0716552734375
    'sbg:y': -710.9133911132812
  - id: duplex_bam_stats_pool_a
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_duplex_bam/gatk_collect_insert_size_metrics_txt_pool_a
          - qc_duplex_bam/gatk_collect_insert_size_metrics_histogram_pdf_pool_a
          - qc_duplex_bam/gatk_collect_hs_metrics_txt_pool_a
          - qc_duplex_bam/gatk_collect_hs_metrics_per_target_coverage_txt_pool_a
          - qc_duplex_bam/gatk_collect_hs_metrics_per_base_coverage_txt_pool_a
          - qc_duplex_bam/gatk_collect_alignment_summary_metrics_txt_pool_a
      - id: output_directory_name
        default: duplex_bam_stats_pool_a
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: duplex_bam_stats_pool_a
    'sbg:x': 530.0328979492188
    'sbg:y': -595.6776123046875
  - id: duplex_bam_stats_pool_b
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_duplex_bam/gatk_collect_insert_size_metrics_txt_pool_b
          - qc_duplex_bam/gatk_collect_insert_size_metrics_histogram_pdf_pool_b
          - qc_duplex_bam/gatk_collect_hs_metrics_txt_pool_b
          - qc_duplex_bam/gatk_collect_hs_metrics_per_target_coverage_txt_pool_b
          - qc_duplex_bam/gatk_collect_hs_metrics_per_base_coverage_txt_pool_b
          - qc_duplex_bam/gatk_collect_alignment_summary_metrics_txt_pool_b
      - id: output_directory_name
        default: duplex_bam_stats_pool_b
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: duplex_bam_stats_pool_b
    'sbg:x': 530.8358764648438
    'sbg:y': -479.8985290527344
  - id: duplex_bam_biometrics
    in:
      - id: files
        linkMerge: merge_flattened
        source:
          - qc_duplex_bam/biometrics_major_csv
          - qc_duplex_bam/biometrics_major_json
          - qc_duplex_bam/biometrics_major_plot
          - qc_duplex_bam/biometrics_minor_csv
          - qc_duplex_bam/biometrics_minor_json
          - qc_duplex_bam/biometrics_minor_plot
          - qc_duplex_bam/biometrics_minor_sites_plot
          - qc_duplex_bam/biometrics_extract_pickle
      - id: output_directory_name
        default: duplex_bam_biometrics
    out:
      - id: directory
    run: ../command_line_tools/expression_tools/put_in_dir.cwl
    label: duplex_bam_biometrics
    'sbg:x': 526.955322265625
    'sbg:y': -361.4269104003906
  - id: qc_simplex_bam
    in:
      - id: reference
        source: reference
      - id: simplex_bam
        source: simplex_bam
      - id: pool_b_target_intervals
        source: pool_b_target_intervals
      - id: pool_b_bait_intervals
        source: pool_b_bait_intervals
      - id: pool_a_bait_intervals
        source: pool_a_bait_intervals
      - id: pool_a_target_intervals
        source: pool_a_target_intervals
    out:
      - id: gatk_collect_alignment_summary_metrics_txt_pool_b
      - id: gatk_collect_hs_metrics_per_base_coverage_txt_pool_b
      - id: gatk_collect_hs_metrics_per_target_coverage_txt_pool_b
      - id: gatk_collect_hs_metrics_txt_pool_b
      - id: gatk_collect_insert_size_metrics_histogram_pdf_pool_b
      - id: gatk_collect_insert_size_metrics_txt_pool_b
      - id: gatk_collect_alignment_summary_metrics_txt_pool_a
      - id: gatk_collect_hs_metrics_per_base_coverage_txt_pool_a
      - id: gatk_collect_hs_metrics_per_target_coverage_txt_pool_a
      - id: gatk_collect_hs_metrics_txt_pool_a
      - id: gatk_collect_insert_size_metrics_histogram_pdf_pool_a
      - id: gatk_collect_insert_size_metrics_txt_pool_a
    run: ../qc_simplex_bam/qc_simplex_bam.cwl
    label: qc_simplex_bam
    scatter:
      - simplex_bam
    scatterMethod: dotproduct
    'sbg:x': -126.70350646972656
    'sbg:y': -1048.5262451171875
requirements:
  - class: SubworkflowFeatureRequirement
  - class: ScatterFeatureRequirement
  - class: MultipleInputFeatureRequirement
  - class: InlineJavascriptRequirement
  - class: StepInputExpressionRequirement
$schemas:
  - 'http://schema.org/version/latest/schemaorg-current-http.rdf'
's:author':
  - class: 's:Person'
    's:email': 'mailto:murphyc4@mskcc.org'
    's:identifier': ''
    's:name': Charlie Murphy
's:citation': ''
's:codeRepository': 'https://github.com/msk-access/cwl_subworkflows'
's:contributor':
  - class: 's:Person'
    's:email': 'mailto:murphyc4@mskcc.org'
    's:name': Charlie Murphy
's:dateCreated': '2021-05-19'
's:license': 'https://spdx.org/licenses/Apache-2.0'
