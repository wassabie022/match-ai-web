import React from 'react';
import styles from './HomePage.module.css';

export default function HomePage() {
  const openTelegramBot = () => {
    window.open('https://t.me/Macthaibot', '_blank');
  };

  return (
    <div className={styles.container}>
      <img
        src="https://i.ibb.co/zF0yKCq/image-Photoroom-1.png"
        alt="Logo"
        className={styles.logo}
      />

      <div className={styles.titleContainer}>
        <h1 className={styles.matchText}>MATCH</h1>
        <h1 className={styles.aiText}>AI</h1>
      </div>

      <div className={styles.gradientBorder}>
        <button 
          className={styles.startButton}
          onClick={openTelegramBot}
        >
          <span className={styles.startText}>НАЧАТЬ</span>
        </button>
      </div>
    </div>
  );
}