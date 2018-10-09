import lief

from macho import MachO

m = MachO.from_file('kernelcache.release.iphone11.decompressed')

print('CPU: {}, Subtype: {}'.format(m.header.cputype.name.upper(), m.header.cpusubtype))
print('Build Version: {}'.format(m.load_commands[22].body))
print('Source Version: {}'.format(m.load_commands[23].body))
for lc in m.load_commands:
    if hasattr(lc.type, 'segment_64'):
        if hasattr(lc.body, 'sections'):
            for sec in lc.body.sections:
                print('{}.{}'.format(sec.seg_name, sec.sect_name))
        # else:
        #     print(lc.body.segname)

m2 = lief.parse('kernelcache.release.iphone11.decompressed')
print(m2)
