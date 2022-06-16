class: Workflow
cwlVersion: v1.0
id: postprocessingwrkflow
label: postProcessingWrkflow
$namespaces:
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: refFasta
    type: File
    secondaryFiles:
      - .fai
    'sbg:x': -538.2053833007812
    'sbg:y': -103.44498443603516
  - id: sortonly_input
    type: File
    'sbg:x': 369.2935791015625
    'sbg:y': 290.21844482421875
  - id: normalize_sort_input
    type: File
    'sbg:x': -292.9486999511719
    'sbg:y': 183.7336883544922
  - id: tumorBam
    type: File?
    'sbg:x': -620.7823486328125
    'sbg:y': -375.3398742675781
  - id: region_Of_Interest_Bedfile
    type: File?
    'sbg:x': -782.35888671875
    'sbg:y': -128.01513671875
  - id: sampleName
    type: string?
    'sbg:x': -740.7139282226562
    'sbg:y': -252.20782470703125
  - id: filter_For_PassFilter
    type: boolean?
    'sbg:x': -658.7418823242188
    'sbg:y': 205.45843505859375
  - id: outputVcf_name
    type: string
    'sbg:x': -723.66259765625
    'sbg:y': 43.330074310302734
  - id: tsampleName
    type: string
    'sbg:x': -814.5510864257812
    'sbg:y': -344.4085998535156
  - id: complexvcf_bgzip_output_name
    type: string?
    'sbg:x': -665.4901733398438
    'sbg:y': 606.4901733398438
  - id: complexvcf_sort_output_name
    type: string
    'sbg:x': -687.45751953125
    'sbg:y': 724.1961059570312
  - id: complexvcf_norm_output_name
    type: string?
    'sbg:x': -636.3202514648438
    'sbg:y': 860.3594970703125
  - id: concat_output_name
    type: string
    'sbg:x': -510.92156982421875
    'sbg:y': 369.7189636230469
  - id: sort_output_name_sortonly
    type: string
    'sbg:x': -421.6850280761719
    'sbg:y': 875.02734375
  - id: bgzip_output_name_sortonly
    type: string?
    'sbg:x': -190.74244689941406
    'sbg:y': 913.9622802734375
outputs:
  - id: txt
    outputSource:
      - pv_vardictandfilter/txt
    type: File
    'sbg:x': -26.5175724029541
    'sbg:y': -151.3258819580078
  - id: vcf
    outputSource:
      - pv_vardictandfilter/vcf
      - sortonly_input
      - normalize_sort_input
    type: 'File[]'
    'sbg:x': 260.18310546875
    'sbg:y': -229.2333526611328
  - id: bcftools_concat_output
    outputSource:
      - concat/bcftools_concat_output
    type: File
    'sbg:x': 130.9866943359375
    'sbg:y': 592.0882568359375
steps:
  - id: pv_vardictandfilter
    in:
      - id: refFasta
        source: refFasta
      - id: tumorBam
        source: tumorBam
      - id: region_Of_Interest_Bedfile
        source: region_Of_Interest_Bedfile
      - id: sampleName
        source: sampleName
      - id: filter_For_PassFilter
        source: filter_For_PassFilter
      - id: alleleFrequency
        default: '0.01'
      - id: outputVcf_name
        source: outputVcf_name
      - id: tsampleName
        source: tsampleName
    out:
      - id: vcf
      - id: txt
    run: ./pv_vardictandfilter.cwl
    label: pv_vardictAndfilter
    'sbg:x': -214.29869079589844
    'sbg:y': -159.00978088378906
  - id: concat
    in:
      - id: normalize_sort_input
        source: normalize_sort_input
      - id: fastaRef
        source: refFasta
      - id: check_ref
        default: s
      - id: bgzip_output_name
        source: complexvcf_bgzip_output_name
      - id: bcftools_sort_output_name
        source: complexvcf_sort_output_name
      - id: bcftools_norm_output_name
        source: complexvcf_norm_output_name
      - id: multiallelics
        default: '-any'
      - id: output_type
        default: z
      - id: preset
        default: vcf
      - id: allow_overlaps
        default: true
      - id: concat_output_name
        source: concat_output_name
      - id: stdout
        default: true
      - id: sortonly_input
        source: sortonly_input
      - id: bgzip_output_name_sortonly
        source: bgzip_output_name_sortonly
      - id: sort_output_name_sortonly
        source: sort_output_name_sortonly
    out:
      - id: bcftools_concat_output
    run: ./concat.cwl
    label: concat
    'sbg:x': -121
    'sbg:y': 600.9408569335938
requirements:
  - class: SubworkflowFeatureRequirement
$schemas:
  - 'http://schema.org/version/latest/schemaorg-current-http.rdf'
's:author':
  - class: 's:Person'
    's:email': 'mailto:sivaprk@mskcc.org'
    's:identifier': ''
    's:name': Karthigayini Sivaprakasam
  - class: 's:Person'
    's:email': 'mailto:shahr@mskcc.org'
    's:identifier': ''
    's:name': Ronak Shah
's:citation': ''
's:codeRepository': 'https://github.com/msk-access/cwl_subworkflows/variant_postprocessing'
's:contributor':
  - class: 's:Person'
    's:email': 'mailto:sivaprk@mskcc.org'
    's:identifier': ''
    's:name': Karthigayini Sivaprakasam
  - class: 's:Person'
    's:email': 'mailto:shahr@mskcc.org'
    's:identifier': ''
    's:name': Ronak Shah
's:dateCreated': 2020-06-2
's:license': 'https://spdx.org/licenses/Apache-2.0'
