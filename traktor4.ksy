meta:
  id: traktor4
  file-extension: bin
  endian: le
    
seq:
  - id: trmd
    type: trmd

types:
  trmd:
    seq:
      - id: name
        contents: 'DMRT'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: hdr
        type: hdr
      - id: data
        type: data
  hdr:
    seq:
      - id: name
        contents: 'RDH '
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: chks
        type: checksum
      - id: domf
        type: date_of_modification
      - id: version
        type: version
  date_of_modification:
    seq:
      - id: name
        contents: 'DOMF'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: date
        type: date
  version:
    seq:
      - id: name
        contents: 'NSRV'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: version
        type: u4
  checksum:
    seq:
      - id: name
        contents: 'SKHC'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: checksum_value
        type: u4
  date:
    seq:
      - id: year
        type: u1
      - id: month
        type: u1
      - id: day
        type: u2le
  data:
    seq:
      - id: name
        contents: 'ATAD'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: andb
        type: andb
      - id: auid
        type: auid
      - id: bitrate
        type: bitr
      - id: bpmq
        type: bpmq
      - id: cuep
        type: cuep
      - id: flgs
        type: flags
      - id: hbpm
        type: hbpm
      - id: ipdt
        type: ipdt
      - id: mkey
        type: mkey
      - id: pcdb
        type: pcdb
      - id: pkdb
        type: pkdb
      - id: sync
        type: sync
      - id: title
        type: title
      - id: tlen
        type: tlen
      - id: trn3
        type: trn3
  trn3:
    seq:
      - id: name
        contents: '3NRT'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: value
        type: u1
        repeat: eos
        # repeat-expr: 50
  tlen:
    seq:
      - id: name
        contents: 'NELT'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: value
        type: u4
  title:
    seq:
      - id: name
        contents: '2TIT'
      - id: title_length
        type: u4
      - id: number_of_children
        type: u4
      - id: title
        type: str
        size: title_length
        encoding: ASCII
  sync:
    seq:
      - id: name
        contents: 'CNYS'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: maty
        type: maty
  maty:
    seq:
      - id: name
        contents: 'YTAM'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: value
        type: u4   
  ipdt:
    seq:
      - id: name
        contents: 'TDPI'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: value
        type: date   
  pkdb:
    seq:
      - id: name
        contents: 'BDKP'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: value
        type: f4
  pcdb:
    seq:
      - id: name
        contents: 'BDCP'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: value
        type: f4   
  mkey:
    seq:
      - id: name
        contents: 'YEKM'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: value
        type: u4   
  hbpm:
    seq:
      - id: name
        contents: 'MPBH'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: value
        type: f4   
  flags:
    seq:
      - id: name
        contents: 'SGLF'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: value
        type: u4      
  andb:
    seq:
      - id: name
        contents: 'BDNA'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: values
        type: u1
        repeat: expr
        repeat-expr: length 
  auid:
    seq:
      - id: name
        contents: 'DIUA'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: values
        type: u1
        repeat: expr
        repeat-expr: length 
  bitr:
    seq:
      - id: name
        contents: 'RTIB'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: bitrate
        type: u4
  bpmq:
    seq:
      - id: name
        contents: 'QMPB'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: bpm
        type: u4
  cuep:
    seq:
      - id: name
        contents: 'PEUC'
      - id: length
        type: u4
      - id: number_of_children
        type: u4
      - id: cuepoints
        type: cuepoint
        # repeat: expr
        # repeat-expr: 1
  cuepoint:
    seq:
      - id: unkwn
        type: u4
        repeat: expr
        repeat-expr: 2
      - id: name_length
        type: u4
      - id: name
        type: str
        size: 2 * name_length
        encoding: ASCII
      - id: display_order
        type: u4
      - id: type
        type: u4  
      - id: start
        type: f8
      - id: length
        type: f8
      - id: repeats
        type: u4
      - id: hotcue
        type: u4