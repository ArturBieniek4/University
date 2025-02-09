# https://gist.github.com/CGrassin/26a1fdf4fc5de788da9b376ff717516e
def getFrequency(note, A4=440):
    notes = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']

    octave = int(note[2]) if len(note) == 3 else int(note[1])
        
    keyNumber = notes.index(note[0:-1]);
    
    if (keyNumber < 3) :
        keyNumber = keyNumber + 12 + ((octave - 1) * 12) + 1; 
    else:
        keyNumber = keyNumber + ((octave - 1) * 12) + 1; 

    return A4 * 2** ((keyNumber- 49) / 12)

for note in ['A', 'B', 'C', 'D', 'E', 'F', 'G']:
    print(getFrequency(note+"3"), end=",\n")
print(getFrequency('C4'))