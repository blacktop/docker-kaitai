from macho import MachO

m = MachO.from_file('kernelcache.release.iphone11.decompressed')

print('CPU: {}, subtype: {}'.format(m.header.cputype.name.upper(), m.header.cpusubtype))
print('Build Version: {} {}, SDK: {}'.format(
    m.load_commands[22].body.platform.name,
    m.load_commands[22].body.minos,
    m.load_commands[22].body.sdk,
))
print('Source Version: {}'.format(m.load_commands[23].body))
