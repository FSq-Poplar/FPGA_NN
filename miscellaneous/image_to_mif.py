from PIL import Image
import os

# Image directories
input_image = os.getcwd() + os.sep + "background.png"
output_mif = os.getcwd() + os.sep + "background.mif"

header = "WIDTH=15;\n{0}\nADDRESS_RADIX=HEX;" \
          "\nDATA_RADIX=HEX;\n\nCONTENT BEGIN\n"


def image_to_mif():
    """Converts an input image into a MIF file"""
    # Setup
    pic = Image.open(input_image)
    mif_output = open(output_mif, 'w+')
    img_width = pic.size[0]
    img_height = pic.size[1]

    # Writes header
    mif_output.write(header.format("DEPTH=" +
                                   str(img_width * img_height) + ";\n"))

    # Writing the values pixel by pixel onto the MIF file
    counter = 0
    for y in range(0, img_height):
        for x in range(0, img_width):
            r = pic.getpixel((x, y))[0] & 248
            g = pic.getpixel((x, y))[1] & 248
            b = pic.getpixel((x, y))[2] & 248
            total = r << 7 | g << 2 | b >> 3
            hexa = hex(total)
            if total == 0:
                hexa = "0x0000"
            mif_output.write("\t" + hex(counter)[2:] + "\t:\t" +
                             hexa[2:] + ";\n")
            counter += 1

    mif_output.write("END;")


if __name__ == "__main__":
    image_to_mif()
