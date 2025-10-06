#  SQL Analysis of Skin Cancer Dataset — *DermAI Diagnostics Project*

##  Project Overview
Skin cancer remains one of the most common yet preventable forms of cancer globally. Early detection plays a critical role in patient outcomes.  
This project explores **1,088 clinical records** from the *DermAI Diagnostics* skin cancer dataset using **SQL-based analysis** to uncover relationships between **demographics, lifestyle habits, environmental exposure,** and **lesion characteristics**.  

The goal is to identify key factors influencing different skin cancer types and demonstrate how structured SQL analysis can support data-driven healthcare decisions.

---

##  Dataset Description
The dataset consists of two relational tables:

### **1️⃣ Patient_Info**
Contains patient demographics and lifestyle factors:
- `patient_id`: Unique identifier for each patient  
- `age`: Patient’s age  
- `gender`: Male/Female  
- `smoke`, `drink`: Lifestyle habits (TRUE/FALSE)  
- `background_father`, `background_mother`: Ethnic background  
- `pesticide`: Exposure to pesticides  
- `has_piped_water`, `has_sewage_system`: Access to utilities  
- `skin_cancer_history`, `cancer_history`: Past personal or family cancer history  

###  Lesion_Info**
Captures lesion characteristics:
- `lesion_id`: Unique identifier for each lesion  
- `patient_id`: Foreign key linking to Patient_Info  
- `fitspatrick`: Fitzpatrick skin type scale (1–6)  
- `region`: Body area affected  
- `diameter_1`, `diameter_2`: Lesion size in mm  
- `diagnostic`: Type of lesion (BCC, MEL, NEV, etc.)  
- `itch`, `grew`, `hurt`, `changed`, `bleed`, `elevation`: Symptom indicators  
- `biopsed`: Whether lesion was biopsy-confirmed  

---

## 🧬 Cancer Classification Overview
Skin lesions in the dataset are categorized as:

- **Malignant (Cancerous):**  
  *Melanoma (MEL), Squamous Cell Carcinoma (SCC), Basal Cell Carcinoma (BCC)* — aggressive types that can spread if untreated.  

- **Benign (Non-Cancerous):**  
  *Nevus (NEV)* and *Seborrheic Keratosis (SEK)* — typically harmless but require observation.  

- **Precancerous:**  
  *Actinic Keratosis (ACK)* — may progress into SCC if untreated. Early detection is crucial.

---

## 🎯 Project Objectives
- Use SQL to analyze and interpret structured clinical data.  
- Identify demographic and environmental factors correlated with different lesion types.  
- Examine lesion features to distinguish malignant, benign, and precancerous cases.  
- Provide insights that can support early detection and dermatological research.

---

## 🧩 Tools & Technologies
- **Database:** MySQL,PostgreSQL
- **Language:** SQL 
- **Data Size:** 1,088 patient records (2 joined tables)

---

## 📈 Key Analytical Findings

### 🧍 Demographics
- **Age:** Ranged from 6–94 years. Risk increases significantly with age.  
- **Gender:** 726 males and 362 females — higher prevalence in males.  
- **Fitzpatrick Scale:** Very fair-skinned individuals (types 0–2) showed the highest risk; darker skin (type 6) showed the lowest.  

### 🩻 Lesion Characteristics
- Commonly affected areas: face, forearms, chest, back, arms — areas with high sun exposure.  
- Lesion pattern differences:
  - **Melanoma:** Growth + color change; no itch, pain, or bleeding.  
  - **SCC:** Growth + itch + elevation.  
  - **BCC:** Growth + itching + bleeding.  
  - **Benign (NEV, SEK):** Growth + elevation only.  
  - **ACK:** Frequently caused itching — making it distinct.

### 🌍 Environmental & Lifestyle Factors
- **Smoking:** 62 smokers; 47 had malignant lesions → possible increased risk.  
- **Alcohol:** 138 drinkers; 98 had malignant cancers → correlation noted.  
- **Pesticide & Water Access:** No significant impact observed.

---

## 🚨 Focus on Actinic Keratosis (ACK)
ACK emerged as the **most dominant lesion type** in the dataset.  
It is a **precancerous condition** that can evolve into SCC if untreated — highlighting a vital early intervention opportunity.

**Why ACK Matters:**
- Common among fair-skinned, elderly, and outdoor workers.  
- Strongly associated with chronic sun exposure.  
- Early diagnosis and treatment can prevent cancer progression.

---

## 💡 Actionable Recommendations

### 1. Public Awareness
- Educate communities that ACK is not harmless but an early warning sign.  
- Promote recognition of rough, itchy, scaly skin patches on sun-exposed areas.  

### 2. Early Screening
- Implement skin-check programs for high-risk groups (elderly, fair-skinned, farmers, outdoor workers).  
- Encourage periodic dermatologist visits.

### 3. Sun Protection
- Promote use of sunscreen, hats, and protective clothing.  
- Governments/NGOs can subsidize sunscreen in high-risk regions.

### 4. Medical Protocols
- Train primary healthcare providers to recognize ACK.  
- Recommend biopsy for persistent or evolving lesions.  
- Apply effective treatments such as cryotherapy or photodynamic therapy.

### 5. Policy & Research
- Recognize ACK as a preventable cancer precursor in public health programs.  
- Support longitudinal studies on ACK progression across skin types.

---

## 🩺 Conclusion
This SQL analysis highlights how structured data exploration can reveal critical health insights.  
Key takeaways include:
- **Age and skin tone** are major risk factors for skin cancer.  
- **ACK dominance** indicates the need for stronger early intervention.  
- **Lifestyle habits** such as smoking and drinking may elevate risk.  
- **SQL** enables efficient pattern discovery in clinical datasets, bridging the gap between data and healthcare.




## 👤 Author
**Muhammad Abdus-Salam**  
Data Analyst | SQL & Data Science Enthusiast  
📧 muhammadalayyubi1075ad@gmail.com

