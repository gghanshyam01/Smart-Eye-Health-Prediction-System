-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2017 at 04:37 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthprediction`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnosehistory`
--

CREATE TABLE `diagnosehistory` (
  `Username` varchar(20) NOT NULL,
  `EnteredSymptom` varchar(76) NOT NULL,
  `PredictedDisease` varchar(41) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diagnosehistory`
--

INSERT INTO `diagnosehistory` (`Username`, `EnteredSymptom`, `PredictedDisease`) VALUES
('Ghanshyam', 'Poor night vision', 'Cataracts'),
('Ghanshyam', 'Poor night vision', 'Cataracts'),
('Ghanshyam', 'Eyelid redness', 'Infected Tear Duct'),
('Ghanshyam', 'Light sensitivity', 'Contact Lens Discomfort'),
('Ghanshyam', 'Feeling of heaviness in eyes', 'Tired Eyes'),
('Ghanshyam', 'Eye burning', 'Contact Lens Discomfort'),
('Ghanshyam', 'Headache', 'Bells Palsy'),
('Ghanshyam', 'Fever', 'Infected Tear Duct'),
('ashish m', 'Blurred distance vision', 'Astigmatism'),
('ashish m', 'Poor vision in one eye', 'Lazy Eye'),
('ashish m', 'Redness', 'Allergies'),
('ashish m', 'Eye burning', 'Contact Lens Discomfort'),
('ashish m', 'Eye burning', 'Contact Lens Discomfort'),
('Ghanshyam', 'Unusual eye secretion', 'Contact Lens Discomfort'),
('Ghanshyam', 'Peripheral vision loss', 'CMV Retinitis'),
('Ghanshyam', 'Floaters in the eye', 'Uveitis'),
('Ghanshyam', 'Unusual eye secretion', 'Contact Lens Discomfort'),
('Ghanshyam', 'Eye redness', 'Contact Lens Discomfort'),
('Ghanshyam', 'Bulging eyes', 'Graves Disease'),
('Ghanshyam', 'Inconsistent eye movement', 'Eye Trauma'),
('Ghanshyam', 'Usually wisp-like shapes that go away almost immediately', 'CMV Retinitis'),
('Ghanshyam', 'Redness', 'Allergies'),
('Ghanshyam', 'Blurred vision', 'Uveitis'),
('Ghanshyam', 'Fever', 'Infected Tear Duct'),
('Ghanshyam', 'excessive eye watering', 'Allergies'),
('Ghanshyam', 'Build-up or crusting overnight that makes it difficult to open your eyes', 'Pink Eye (conjunctivitis)'),
('Admin', 'Difficulty distinguishing colors', 'Color Blindness'),
('Ghanshyam', 'Eyelid redness', 'Infected Tear Duct'),
('Admin', 'Eye inflammation', 'Infected Tear Duct'),
('Admin', 'Eye Itching', 'Allergies'),
('ashish m', 'Neck pain', 'Computer Vision Syndrome (CVS)'),
('ashish m', 'Dry eyes', 'Rheumatoid Arthritis-Related Eye Concerns'),
('Ghanshyam', 'Appearance of grey curtain over part of your vision', 'Retinal Detachment'),
('Ghanshyam', 'Dry eyes', 'Rheumatoid Arthritis-Related Eye Concerns'),
('Ghanshyam', 'Rainbows or halos around objects', 'Contact Lens Discomfort');

-- --------------------------------------------------------

--
-- Table structure for table `feedbackdetails`
--

CREATE TABLE `feedbackdetails` (
  `Username` varchar(20) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Feedback` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbackdetails`
--

INSERT INTO `feedbackdetails` (`Username`, `Email`, `Feedback`) VALUES
('Ghanshyam', 'gghanshyam01@gmail.com', 'Good Design'),
('ashish m', 'mishra@abc.com', 'Result was good!!'),
('ashish m', 'mishra@abc.com', 'Result was good!!'),
('ashish m', 'mishra@abc.com', 'Result was good!!'),
('Ghanshyam', 'ashmishra@gmail.com', 'cc'),
('Ghanshyam', 'gghanshyam01@gmail.com', 'Hi test'),
('Ghanshyam', 'gghanshyam01@gmail.com', 'Hi test');

-- --------------------------------------------------------

--
-- Table structure for table `healthpredictiondataset`
--

CREATE TABLE `healthpredictiondataset` (
  `Symptoms` varchar(76) CHARACTER SET utf8 DEFAULT NULL,
  `Disease` varchar(41) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `healthpredictiondataset`
--

INSERT INTO `healthpredictiondataset` (`Symptoms`, `Disease`) VALUES
('Blurred distance vision', 'Nearsightedness (Myopia)'),
('Frequent eye squinting', 'Nearsightedness (Myopia)'),
('Headache', 'Nearsightedness (Myopia)'),
('Eye strain', 'Nearsightedness (Myopia)'),
('Blurred near vision', 'Farsightedness (Hyperopia)'),
('Blurred distance vision', 'Farsightedness (Hyperopia)'),
('Blurred near vision', 'Astigmatism'),
('Blurred distance vision', 'Astigmatism'),
('Headache', 'Astigmatism'),
('Eye strain', 'Astigmatism'),
('Frequent eye squinting', 'Astigmatism'),
('Difficulty driving at night', 'Astigmatism'),
('Blurred near vision', 'Presbyopia'),
('Headache', 'Presbyopia'),
('Eye strain', 'Presbyopia'),
('Redness', 'Allergies'),
('excessive eye watering', 'Allergies'),
('Eye Itching', 'Allergies'),
('Sneezing', 'Allergies'),
('Sinus activity', 'Allergies'),
('Eye strain', 'Computer Vision Syndrome (CVS)'),
('Headache', 'Computer Vision Syndrome (CVS)'),
('Blurred vision', 'Computer Vision Syndrome (CVS)'),
('Dry eyes', 'Computer Vision Syndrome (CVS)'),
('Neck pain', 'Computer Vision Syndrome (CVS)'),
('Shoulder pain', 'Computer Vision Syndrome (CVS)'),
('Eye stinging', 'Contact Lens Discomfort'),
('Eye burning', 'Contact Lens Discomfort'),
('Eye Itching', 'Contact Lens Discomfort'),
('Other eye pain', 'Contact Lens Discomfort'),
('Comfort is less than when lens was first placed on eye', 'Contact Lens Discomfort'),
('Feeling of foreign object in the eye', 'Contact Lens Discomfort'),
('excessive eye watering', 'Contact Lens Discomfort'),
('Unusual eye secretion', 'Contact Lens Discomfort'),
('Eye redness', 'Contact Lens Discomfort'),
('Blurred vision', 'Contact Lens Discomfort'),
('Rainbows or halos around objects', 'Contact Lens Discomfort'),
('Light sensitivity', 'Contact Lens Discomfort'),
('Dry eyes', 'Contact Lens Discomfort'),
('Feeling of foreign object in the eye', 'Eyelid Irritation'),
('excessive eye watering', 'Eyelid Irritation'),
('Eye Itching', 'Eyelid Irritation'),
('Light sensitivity', 'Eyelid Irritation'),
('Eye redness', 'Eyelid Irritation'),
('Swollen eyelids', 'Eyelid Irritation'),
('Dry eyes', 'Eyelid Irritation'),
('Crusted or scaly texture', 'Eyelid Irritation'),
('Eye redness', 'Infected Tear Duct'),
('Eyelid redness', 'Infected Tear Duct'),
('Eye inflammation', 'Infected Tear Duct'),
('excessive eye watering', 'Infected Tear Duct'),
('Fever', 'Infected Tear Duct'),
('Feeling of foreign object in the eye', 'Pink Eye (conjunctivitis)'),
('Eye burning', 'Pink Eye (conjunctivitis)'),
('Eye Itching', 'Pink Eye (conjunctivitis)'),
('Yellowish discharge from one or both eyes', 'Pink Eye (conjunctivitis)'),
('excessive eye watering', 'Pink Eye (conjunctivitis)'),
('Build-up or crusting overnight that makes it difficult to open your eyes', 'Pink Eye (conjunctivitis)'),
('Swollen eyelids', 'Pink Eye (conjunctivitis)'),
('Eye Itching', 'Tired Eyes'),
('Eye redness', 'Tired Eyes'),
('Dry eyes', 'Tired Eyes'),
('excessive eye watering', 'Tired Eyes'),
('Blurred vision', 'Tired Eyes'),
('Light sensitivity', 'Tired Eyes'),
('Shoulder pain', 'Tired Eyes'),
('Neck pain', 'Tired Eyes'),
('Feeling of heaviness in eyes', 'Tired Eyes'),
('Appearance of protruding eyes', 'Bulging Eyes'),
('Dry eyes', 'Bulging Eyes'),
('Visible whiteness between the top of the iris and the eyelid', 'Bulging Eyes'),
('Blurred vision', 'Cataracts'),
('Light sensitivity', 'Cataracts'),
('Frequent prescription changes for glasses or contact lenses', 'Cataracts'),
('Poor night vision', 'Cataracts'),
('Color vision changes and dimming', 'Cataracts'),
('Double vision in a single eye', 'Cataracts'),
('Visible appearance of black shapes and lines', 'CMV Retinitis'),
('Usually wisp-like shapes that go away almost immediately', 'CMV Retinitis'),
('Blurred vision ', 'CMV Retinitis'),
('Blind spot in vision ', 'CMV Retinitis'),
('Peripheral vision loss', 'CMV Retinitis'),
('Difficulty distinguishing colors', 'Color Blindness'),
('Inability to identify color tones', 'Color Blindness'),
('Inconsistent eye movement', 'Crossed Eyes (Strabismus)'),
('Unsymmetrical points of reflection in each eye', 'Crossed Eyes (Strabismus)'),
('Tilting the head to one side', 'Crossed Eyes (Strabismus)'),
('Inability to gauge depth', 'Crossed Eyes (Strabismus)'),
('Squinting with only one eye', 'Crossed Eyes (Strabismus)'),
('Blurred vision', 'Diabetic Macular Edema'),
('Wavy vision', 'Diabetic Macular Edema'),
('Changes viewing colors', 'Diabetic Macular Edema'),
('Distorted vision at all distances', 'Keratoconus'),
('Glare', 'Keratoconus'),
('“Ghost” images – the appearance of several images when looking at one object', 'Keratoconus'),
('Frequent prescription changes for glasses or contact lenses', 'Keratoconus'),
('Significant favoring of one eye', 'Lazy Eye'),
('Inability to gauge depth', 'Lazy Eye'),
('Poor vision in one eye', 'Lazy Eye'),
('Increase in number and size of eye floaters', 'Retinal Detachment'),
('Floaters with flashes', 'Retinal Detachment'),
('Shadow(s) in peripheral vision', 'Retinal Detachment'),
('Appearance of grey curtain over part of your vision', 'Retinal Detachment'),
('Sudden vision decrease', 'Retinal Detachment'),
('Excessive eyes blinking', 'Eyelid Twitching'),
('Eye Itching', 'Eyelid Twitching'),
('Fatigue/tension', 'Eyelid Twitching'),
('Involuntary muscle movement around eyes', 'Eyelid Twitching'),
('Light sensitivity', 'Eyelid Twitching'),
('Light sensitivity', 'Uveitis'),
('Blurred vision', 'Uveitis'),
('Eye pain', 'Uveitis'),
('Eye redness', 'Uveitis'),
('Floaters in the eye', 'Uveitis'),
('Blurred vision', 'Uveitis'),
('Eye pain', 'Eye Trauma'),
('Blurred vision', 'Eye Trauma'),
('Cuts to the eyelid', 'Eye Trauma'),
('Inconsistent eye movement', 'Eye Trauma'),
('One eye sticks out', 'Eye Trauma'),
('Blood in the clear part of the eye', 'Eye Trauma'),
('Unusual pupil size or shape', 'Eye Trauma'),
('Something embedded in the eye', 'Eye Trauma'),
('Something under the eyelid that cannot be easily removed', 'Eye Trauma'),
('Numbness on one side of the face', 'Bells Palsy'),
('Twitching of facial muscles', 'Bells Palsy'),
('Dry eyes', 'Bells Palsy'),
('Mouth dryness', 'Bells Palsy'),
('excessive eye watering', 'Bells Palsy'),
('Drooling', 'Bells Palsy'),
('Difficulty eating and drinking', 'Bells Palsy'),
('Pain around jaw', 'Bells Palsy'),
('Pain behind ear', 'Bells Palsy'),
('Headache', 'Bells Palsy'),
('Eye floaters', 'Diabetes Related Eye Problems'),
('Blurred vision', 'Diabetes Related Eye Problems'),
('Dark spot in center of vision', 'Diabetes Related Eye Problems'),
('Poor night vision', 'Diabetes Related Eye Problems'),
('Eye inflammation', 'Graves Disease'),
('Eye redness', 'Graves Disease'),
('Bulging eyes', 'Graves Disease'),
('Dry eyes', 'Graves Disease'),
('Gritty sensation', 'Graves Disease'),
('Eye pain', 'Graves Disease'),
('Light sensitivity', 'Graves Disease'),
('double vision', 'Graves Disease'),
('vision loss', 'Graves Disease'),
('Eye redness', 'Rheumatoid Arthritis-Related Eye Concerns'),
('Eye pain', 'Rheumatoid Arthritis-Related Eye Concerns'),
('Dry eyes', 'Rheumatoid Arthritis-Related Eye Concerns'),
('Blurred vision', 'Rheumatoid Arthritis-Related Eye Concerns'),
('Dry eyes', 'Rheumatoid Arthritis-Related Eye Concerns'),
('Gritty sensation', 'Rheumatoid Arthritis-Related Eye Concerns'),
('Light sensitivity', 'Rheumatoid Arthritis-Related Eye Concerns'),
('Dry eyes', 'Sjogrens Syndrome'),
('Eye irritation', 'Sjogrens Syndrome'),
('Low tear production', 'Sjogrens Syndrome'),
('Feeling of foreign object in the eye', 'Sjogrens Syndrome');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `Username` varchar(20) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`Username`, `Email`, `Password`) VALUES
('Admin', 'gghanshyam01@gmail.com', 'F61F862AC9B7B8B4859A5D5FD57A6A165436F6A2'),
('Ashish', 'ashmishra@gmail.com', '8CB2237D0679CA88DB6464EAC60DA96345513964'),
('ashish m', 'mishraashish034@gmail.com', '8CB2237D0679CA88DB6464EAC60DA96345513964'),
('Ghanshyam', 'gghanshyam01@gmail.com', 'F61F862AC9B7B8B4859A5D5FD57A6A165436F6A2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diagnosehistory`
--
ALTER TABLE `diagnosehistory`
  ADD KEY `Username` (`Username`),
  ADD KEY `EnteredSymptom` (`EnteredSymptom`),
  ADD KEY `PredictedDisease` (`PredictedDisease`);

--
-- Indexes for table `feedbackdetails`
--
ALTER TABLE `feedbackdetails`
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`Username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedbackdetails`
--
ALTER TABLE `feedbackdetails`
  ADD CONSTRAINT `feedbackdetails_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `userdetails` (`Username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
