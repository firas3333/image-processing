function Fftplotting(fft)
fftImageRealPart = real(fft);
[rows, ~] = size(fftImageRealPart);
lineNumber = floor(rows/2); % Middle row
oneLine = fftImageRealPart(lineNumber, :);
plot(oneLine, 'r-', 'LineWidth', 2);
