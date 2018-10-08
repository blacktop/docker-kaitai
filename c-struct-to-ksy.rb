#!/usr/bin/env ruby

require 'yaml'

TYPE_TO_KSY = {
  'uint8_t' => 'u1',
  'uint16_t' => 'u2',
  'uint32_t' => 'u4',
  'uint64_t' => 'u8',

  'int8_t' => 's1',
  'int16_t' => 's2',
  'int32_t' => 's4',
  'int64_t' => 's8',

  'char' => 's1',
  'short' => 's2',
  'int' => 's4',
  'uint' => 'u4',
  'long' => 's8',
  'float' => 'f4',
  'double' => 'f8',

  'WORD' => 'u2',
  'DWORD' => 'u4',

  '__s32' => 's4',
  '__s64' => 's8',
}

def parse_body(body)
  r = []

  body.gsub(/\s*([A-Za-z0-9_]+)\s+([A-Za-z0-9_]+)\s*;\s*(\/\*\s*(.*?)\s*\*\/)?/) {
    type, name, comment, comment_body = $1, $2, $3, $4
    h = {'id' => name, 'type' => TYPE_TO_KSY[type] || type}
    h['doc'] = comment_body unless comment_body.nil? or comment_body.empty?
    r << h
  }
  r
end

r = {}

$stdin.read.gsub(/struct\s+([A-Za-z0-9_]+)?\s*\{(.*?)\}\s*(.*?);/m) {
  tag, body, name = $1, $2, $3
  name = name.split(/\s*,\s*/)[0]
  name = tag if name.nil? or name.empty?
  r[name] = parse_body(body)
}

puts({'types' => r}.to_yaml)