/*
 * Extraction of perpendicular luminance intensity profiles from TEM images
 * for semi-automated quantification of cell wall and cuticle thickness.
 *
 * This macro generates luminance intensity profiles along vertical lines
 * drawn at regular intervals across the image. The extracted profiles are
 * exported as a CSV file for downstream percentile-based analysis in Python.
 *
 * Required inputs:
 *  - Input image must be a grayscale image
 *  - Image is automatically converted to 32-bit prior to analysis
 *  - Image should be preprocessed (straightened and cropped) such that
 *    the inner edge of the cell wall is aligned horizontally
 *
 * Analysis parameters:
 *  - step: interval between adjacent sampling lines in pixels (set to 50 pixels in this study)
 *
 * Output:
 *  - CSV file containing X position, Y position, and luminance intensity
 *    values for each sampled pixel along each profile line
 */

// ===================== USER-DEFINED PARAMETERS =====================
step = 50;  // Sampling interval (pixels)
outputPath = "C:/temp/pistil_profile_csv_250921/pistil_profile_12-1.csv";
// ==================================================================

// Ensure consistent bit-depth for reproducible intensity analysis
run("32-bit");

// -------- Initialization --------
run("Clear Results");

width  = getWidth();
height = getHeight();
rowIndex = 0;


// -------- Profile extraction --------
for (x = 0; x < width; x += step) {

    // Draw vertical line across full image height
    makeLine(x, 0, x, height);
    wait(50);

    // Extract luminance profile along the line
    profile = getProfile();

    // Store profile data in Results table
    for (i = 0; i < profile.length; i++) {
        setResult("X", rowIndex, x);
        setResult("Y", rowIndex, i);
        setResult("Profile", rowIndex, profile[i]);
        rowIndex++;
    }
}


// -------- Finalization --------
updateResults();

// Report number of extracted data points
rowCount = nResults;
print("Number of data points exported:", rowCount);

// Save results as CSV file
saveAs("Results", outputPath);