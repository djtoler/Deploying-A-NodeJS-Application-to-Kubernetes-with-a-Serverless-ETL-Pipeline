import axios from "axios";

console.log("inside api")

// axios.defaults.baseURL = 'http://fpjbackend-service:80';


export const addUser = async (data) => {
  try {
    return await axios.post(process.env.REACT_APP_SIGNUP_URL, data);
  } catch (error) {
    console.log("Error in adding user", error);
  }
};

export const loginUser = async (data) => {
  try {
    return await axios.post(process.env.REACT_APP_LOGIN_URL, data);
  } catch (error) {
    console.log("Error in logging in ", error);
  }
};

export const logOutUser = () => {
  try {
    return axios.get(process.env.REACT_APP_LOGOUT_URL);
  } catch (error) {
    console.log("Error in logging out", error);
  }
};

export const addQuestion = async (data) => {
  try {
    return await axios.post(process.env.REACT_APP_ADDQUESTION_URL, data);
  } catch (error) {
    console.log("Error in adding question", error);
  }
};

export const updateQuestion = async (data) => {
  try {
    return await axios.post(process.env.REACT_APP_UPDATEQUESTION_URL, data);
  } catch (error) {
    console.log("Error in updating question", error);
  }
};

export const getQuestions = () => {
  try {
    return axios.get(process.env.REACT_APP_GETQUESTIONS_URL);
  } catch (error) {
    console.log("Error in getting questions", error);
  }
};

export const createQuiz = async (data) => {
  try {
    return await axios.post(`/createQuiz`, data);
  } catch (error) {
    console.log("Error in creating Quiz", error);
  }
};

export const getQuiz = () => {
  try {
    return axios.get(process.env.REACT_APP_CREATEQUIZ_URL);
  } catch (error) {
    console.log("Error in getting quiz", error);
  }
};

export const getPlayQuiz = async (data) => {
  try {
    return await axios.post(process.env.REACT_APP_GETPLAYQUIZ_UR, data);
  } catch (error) {
    console.log("Error in getting quiz", error);
  }
};

export const checkAttempt = (data) => {
  try {
    return axios.post(process.env.REACT_APP_CHECKATTEMPT_URL, data);
  } catch (error) {
    console.log("Error in checking attempt", error);
  }
};

export const addAttempt = (data) => {
  try {
    return axios.post(process.env.REACT_APP_ADDATTEMPT_URL, data);
  } catch (error) {
    console.log("Error in adding Attempt", error);
  }
};

export const getResults = (data) => {
  try {
    return axios.post(process.env.REACT_APP_GETRESULTS_URL, data);
  } catch (error) {
    console.log("Error in getting results", error);
  }
};

export const getProfile = () => {
  try {
    return axios.get(process.env.REACT_APP_GETPROFILE_URL);
  } catch (error) {
    console.log("Error in getting profile", error);
  }
};

export const getAttemptQuizes = () => {
  try {
    return axios.get(process.env.REACT_APP_GETATTEMPTQUIZES_URL);
  } catch (error) {
    console.log("Error in getting attempted quizes", error);
  }
};
