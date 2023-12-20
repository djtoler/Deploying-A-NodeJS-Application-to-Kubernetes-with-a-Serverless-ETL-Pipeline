import React from "react";
import styles from "./home.module.scss";
import Login from "./Login";
const Home = () => {
  return (
    <div className={styles.home}>
      <div className={styles.leftContent}>
        <img src="https://fp-lambda-etl-transform.s3.amazonaws.com/51d36fa4c1981eb39a9efaa4b94b8677-removebg-preview.png" alt="" />
      </div>
      <div className={styles.formArea}>
        <Login />
      </div>
    </div>
  );
};

export default Home;
