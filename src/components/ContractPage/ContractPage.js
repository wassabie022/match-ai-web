import React from 'react';
import styles from './ContractPage.module.css';

export default function ContractPage() {
  return (
    <div className={styles.container}>
      <div className={styles.header}>
        <div className={styles.logoContainer}>
          <h1 className={styles.logoText}>
            <span className={styles.logoMatch}>MATCH</span>
            <span className={styles.logoAI}> AI</span>
          </h1>
        </div>
        <h2 className={styles.documentTitle}>
          Договор оказания услуг<br />(публичная оферта)
        </h2>
        <p className={styles.updateDate}>[Обновлено] 4 сентября, 2024</p>
      </div>

      <div className={styles.contentBlock}>
        <p className={styles.mainText}>
          Общество с ограниченной ответственностью SIA VENI VIDI VICI...
        </p>
      </div>

      <section className={styles.section}>
        <h3 className={styles.sectionHeader}>1. ТЕРМИНЫ И ОПРЕДЕЛЕНИЯ</h3>
        
        <p className={styles.subSection}>
          <span className={styles.subSectionNumber}>1.1. </span>
          В настоящем Договоре используются следующие термины:
        </p>

        {[
          {term: 'Оферта', definition: 'настоящий документ...'},
          // ... остальные элементы
        ].map((item, index) => (
          <div key={index} className={styles.definitionItem}>
            <strong className={styles.term}>{item.term}</strong>
            <span className={styles.definition}> – {item.definition}</span>
          </div>
        ))}
      </section>
    </div>
  );
}