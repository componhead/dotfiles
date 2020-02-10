complete -c animate -o alpha -d 'On, activate, off, deactivate, set, opaque, copy transparent, extract, background, or shape [option]' -xa '(animate -list alpha)'
complete -c animate -o authenticate -d 'Decipher image with this password [password]'
complete -c animate -o backdrop -d 'Display image centered on a backdrop'
complete -c animate -o channel -d 'Apply option to select image channels [type]' -xa '(animate -list channel)'
complete -c animate -o colormap -d 'Shared or Private [type]' -x
complete -c animate -o colorspace -d 'Alternate image colorspace [type]' -xa '(animate -list colorspace)'
complete -c animate -o decipher -d 'Convert cipher pixels to plain pixels [filename]' -r
complete -c animate -o define -d 'Define one or more image format options [format:option]'
complete -c animate -o delay -d 'Display the next image after pausing [value]'
complete -c animate -o density -d 'Horizontal and vertical density of the image [geometry]'
complete -c animate -o depth -d 'Image depth [value]'
complete -c animate -o display -d 'Display image to this X server [server]'
complete -c animate -o dispose -d 'Layer disposal method [method]' -xa '(animate -list dispose)'
complete -c animate -o dither -d 'Apply error diffusion to image [method]' -xa '(animate -list dither)'
complete -c animate -o filter -d 'Use this filter when resizing an image [type]' -xa '(animate -list filter)'
complete -c animate -o format -d 'Output formatted image characteristics ["string"]'
complete -c animate -o gamma -d 'Level of gamma correction [value]'
complete -c animate -o geometry -d 'Preferred size and location of the Image window [geometry]'
complete -c animate -o gravity -d 'Horizontal and vertical backdrop placement [type]' -xa '(animate -list gravity)'
complete -c animate -o identify -d 'Identify the format and characteristics of the image'
complete -c animate -o immutable -d 'Displayed image cannot be modified'
complete -c animate -o interlace -d 'Type of image interlacing scheme [type]' -xa '(animate -list interlace)'
complete -c animate -o interpolate -d 'Pixel color interpolation method [method]' -xa '(animate -list interpolate)'
complete -c animate -o limit -d 'Pixel cache resource limit [type value]' -x
complete -c animate -o loop -d 'Loop images then exit [iterations]'
complete -c animate -o map -d 'Display image using this Standard Colormap [type]' -x
complete -c animate -o monitor -d 'Monitor progress '
complete -c animate -o pause -d 'Seconds to pause before reanimating'
complete -c animate -o page -d 'Size and location of an image canvas (setting) [geometry]'
complete -c animate -o quantize -d 'Reduce colors in this colorspace [colorspace]' -xa '(animate -list colorspace)'
complete -c animate -o quiet -d 'Suppress all warning messages'
complete -c animate -o regard-warnings -d 'Pay attention to warning messages'
complete -c animate -o remote -d 'Command execute a command in an remote display process'
complete -c animate -o respect-parentheses -d 'Settings remain in effect until parenthesis boundary'
complete -c animate -o sampling-factor -d 'Horizontal and vertical sampling factor [geometry]'
complete -c animate -o seed -d 'Seed a new sequence of pseudo-random numbers [value]'
complete -c animate -o set -d 'Attribute set an image attribute [ value]'
complete -c animate -o size -d 'Width and height of image [geometry]'
complete -c animate -o transparent-color -d 'Transparent color [color]' -xa '(__fish_complete_convert_options color)'
complete -c animate -o treedepth -d 'Color tree depth [value]'
complete -c animate -o verbose -d 'Print detailed information about the image'
complete -c animate -o visual -d 'Display image using this visual type [type]' -x
complete -c animate -o virtual-pixel -d 'Virtual pixel access method [method]' -xa '(animate -list virtual-pixel)'
complete -c animate -o window -d 'Display image to background of this window [id]' -xa 'root (__fish_print_xwindows)'
complete -c animate -o colors -d 'Preferred number of colors in the image [value]'
complete -c animate -o crop -d 'Preferred size and location of the cropped image [geometry]'
complete -c animate -o extract -d 'Extract area from image [geometry]'
complete -c animate -o monochrome -d 'Transform image to black and white'
complete -c animate -o repage -d 'Size and location of an image canvas (operator) [geometry]'
complete -c animate -o resample -d 'Change the resolution of an image [geometry]'
complete -c animate -o resize -d 'Resize the image [geometry]'
complete -c animate -o rotate -d 'Apply Paeth rotation to the image [degrees]'
complete -c animate -o strip -d 'Strip image of all profiles and comments'
complete -c animate -o thumbnail -d 'Create a thumbnail of the image [geometry]'
complete -c animate -o trim -d 'Trim image edges'
complete -c animate -o coalesce -d 'Merge a sequence of images'
complete -c animate -o flatten -d 'Flatten a sequence of images'
complete -c animate -o debug -d 'Display copious debugging information [events]' -xa '(animate -list debug)'
complete -c animate -o help -d 'Print program options'
complete -c animate -o list -d 'Print a list of supported option arguments [type]' -xa '(animate -list list)'
complete -c animate -o log -d 'Format of debugging information [format]' -xa '(__fish_complete_convert_options format)'
complete -c animate -o version -d 'Print version information Press any button to map or unmap the Command widget'
complete -c animate -o matte -d 'Store matte channel if the image has one'
complete -c animate -o scenes -d 'Range image scene range'
complete -c animate -o support -d 'Resize support: > 1.0 is blurry, < 1.0 is sharp [factor]'