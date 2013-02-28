char Skew(int input, int maximum, int scaled_max) {
    if (input > maximum)
        input = maximum;

    return (char)((double)scaled_max*((double)input/(double)maximum));
}