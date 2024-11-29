Dengue Mosquito Detection Using Digital Signal Processing
Project Overview

This project utilizes Digital Signal Processing (DSP) techniques to detect Dengue-carrying mosquitoes based on their unique wingbeat sound frequencies. By analyzing the frequency domain characteristics of mosquito wingbeats, this system classifies mosquito sounds into two categories: Dengue and Non-Dengue mosquitoes.

The system leverages various signal processing techniques including Fourier Transform and Bandpass Filters to isolate key frequency bands characteristic of dengue mosquitoes. These frequency bands are then used to calculate energy ratios, which form the basis for classification.
Motivation

Dengue fever, transmitted by mosquitoes, is a major public health issue in Sri Lanka and many other tropical countries. Identifying dengue mosquitoes early can help in controlling outbreaks. This project aims to develop an automated method for detecting Dengue mosquitoes based on their wingbeat frequencies, providing a potential tool for surveillance and prevention.
Purpose

The purpose of this project is to demonstrate the effectiveness of frequency domain analysis in identifying dengue mosquitoes, without the need for machine learning. It is implemented as part of the Digital Signal Processing module at the University of Jaffna, for the 5th semester students of the EC5011 course.
Key Features

    Frequency Band Analysis: Focuses on identifying specific frequency bands that are unique to dengue mosquitoes.
        Characteristic frequency bands:
            550-650 Hz
            1050-1200 Hz
            1650-1800 Hz
    Signal Processing: Applies advanced DSP techniques, including Fourier Transform and Bandpass Filters, for analyzing and classifying mosquito wingbeat sounds.
    Energy Ratio Calculation: Calculates energy ratios for filtered signals to classify the mosquito as Dengue or Non-Dengue.
    Data Visualization: Provides graphical representations of the frequency domain analysis and filter responses to illustrate the difference between dengue and non-dengue mosquitoes.

Methodology

    Data Collection: Collect mosquito sound recordings in a controlled environment.
    Preprocessing: Clean the raw data and prepare it for analysis.
    Frequency Domain Analysis: Apply Fourier Transform to convert time-domain signals to the frequency domain.
    Frequency Band Identification: Isolate frequency bands specific to dengue mosquitoes.
    Classification: Use energy ratios from bandpass filtered signals to classify the mosquito sound into Dengue or Non-Dengue categories.

Results

    Dengue Detection Accuracy: 86.6%
    Non-Dengue Detection Accuracy: 79.2%
    Overall Classification Accuracy: 83%

Conclusion

This project successfully demonstrates the application of digital signal processing techniques to identify dengue mosquitoes based on their characteristic wingbeat sounds. The high accuracy achieved highlights the potential of this method for public health surveillance and dengue control efforts.
Repository Structure

    /train: Contains training sound files for both Dengue and Non-Dengue mosquitoes.
    /test: Contains testing sound files for both Dengue and Non-Dengue mosquitoes.
    /code: MATLAB scripts used for processing, classification, and accuracy evaluation.
