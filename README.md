# Fake News Detection on Social Media (Machine Learning)

This repository hosts one of my machine learning research papers together with code snippets that mirror the experiments described in the paper.

## 📄 Paper
- **Title:** Mitigating the Proliferation of Fake News on Social Media with Machine Learning Algorithms
- **Author:** Holly Kwan 
- **TXT:** 'fake_news.txt' 
- **PDF:** `Fake_News_Paper.pdf`

## 🔬 Methods Covered
- Content-Based features (linguistic & syntactic: n-grams, POS)
- Social-Based models:
  - Logistic Regression (LR)
  - Harmonic Boolean Label Crowdsourcing (HC)
- Hybrid selection via a threshold λ
- Support Vector Machine (SVM) with RBF kernel on BuzzFeedData social features

## 🗂️ Repository Structure
```
.
├── fake_news.txt
├── Rscript/
│   └── svm_rbf_tuning.R
└── data/                  # (optional) place datasets here
```

## ▶️ Reproducing SVM Snippet (R)
1. Install packages:
   ```r
   install.packages("e1071")
   ```
2. Place `normal-facebookdata.csv` into `data/` or your working directory.
3. Open and run `code/svm_rbf_tuning.R` in R/RStudio.
   - Define `train` and `test` data frames that include the columns:
     `Rating, share_count, reaction_count, comment_count`.
   - The script includes the tuning grid used in the paper and the selected parameters (C=16, γ=0.08).

## 🔗 Datasets Mentioned (as per paper)
- FacebookData (proprietary)
- PolitiFactData 
- BuzzFeedData

> This repository mirrors the paper’s description; no new claims are introduced here.

## 📚 Citation
If you reference this work, please cite the paper PDF in this repository.
