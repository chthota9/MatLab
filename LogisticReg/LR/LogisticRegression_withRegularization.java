package cmps142_hw4;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class LogisticRegression_withRegularization {

        /** the learning rate */
        private double rate=0.01;

        /** the weights to learn */
        private double[] weights;

		/** the regularization coefficient */
        private double lambda = 0.001;

        /** the number of iterations */
        private int ITERATIONS = 200;

        /** TODO: Constructor initializes the weight vector. Initialize it by setting it to the 0 vector. **/
        public LogisticRegression_withRegularization(int n) { // n is the number of weights to be learned
            this.weights = new double[n]; // initialize weights as a double array
		}

        /** TODO: Implement the function that returns the L2 norm of the weight vector **/
        private double weightsL2Norm(){
            double l2norm = 0;
            for (int i = 0; i < weights.length; i++) {
                l2norm += weights[i] * weights[i]; // square weights to create norm
            }
            return Math.round(Math.sqrt((l2norm))*100)/100.0; //round the squared rooted value
        }

        /** TODO: Implement the sigmoid function **/
        private static double sigmoid(double z) {
              return (1/( 1 + Math.pow(Math.E,(-1*z)))); // returns the sigmoid value
        }

        /** TODO: Helper function for prediction **/
        /** Takes a test instance as input and outputs the probability of the label being 1 **/
        /** This function should call sigmoid() **/
        private double probPred1(double[] x) {
            double sum = 0; 
            for (int i = 0; i < x.length; i++){ // loop through feature vector
                sum += x[i] * this.weights[i]; // multiply x index with weight index
            }
            return sigmoid(sum);
        }

        /** TODO: The prediction function **/
        /** Takes a test instance as input and outputs the predicted label **/
        /** This function should call probPred1() **/
        public int predict(double[] x) {
             if (probPred1(x) >= 0.5){ // predict true if value => 5
                return 1;
            }
            return 0;
        }

        /** This function takes a test set as input, call the predict() to predict a label for it, and prints the accuracy, P, R, and F1 score of the positive class and negative class and the confusion matrix **/
        public void printPerformance(List<LRInstance> testInstances) {
            double acc = 0;
            double p_pos = 0, r_pos = 0, f_pos = 0;
            double p_neg = 0, r_neg = 0, f_neg = 0;
            int TP=0, TN=0, FP=0, FN=0; // TP = True Positives, TN = True Negatives, FP = False Positives, FN = False Negatives

            // TODO: write code here to compute the above mentioned variables
             // caluclate TP, TN, FP , FN
            double TPP=0.0, TNN=0.0, FPP=0.0, FNN=0.0;
            for (int i = 0; i < testInstances.size(); i++){
                int pred = predict(testInstances.get(i).x);
                int label = testInstances.get(i).label;
                if (pred == 1 && label == 1) TPP++; // predicted correctly
                else if (pred == 1 && label == 0) FPP++;  // predicted true incorrectly
                else if (pred == 0 && label == 1) FNN++; // predicteed false incorrectly
                else TNN++;
            }
                      // apply the formulas given to us in the lecture slides
             acc = (TPP + TNN) / testInstances.size();
            p_pos = Math.round((TPP) / (TPP + FPP) *100) /100.0;
            r_pos = Math.round((TPP) / (TPP + FNN) *100)/100.0;
            f_pos = Math.round((2 * p_pos * r_pos) / (p_pos + r_pos) *100)/100.0;

            p_neg = Math.round((TNN) / (TNN + FNN)*100)/100.0;
            r_neg = Math.round((TNN) / (TNN + FPP)*100)/100.0;
            f_neg = Math.round((2 * p_neg * r_neg) / (p_neg + r_neg)*100)/100.0;
            TP = (int)TPP;
            FP = (int)FPP;
            FN = (int)FNN;
            TN = (int)TNN;

             // print neccesary information
            System.out.println("Accuracy="+acc);
            System.out.println("P, R, and F1 score of the positive class=" + p_pos + " " + r_pos + " " + f_pos);
            System.out.println("P, R, and F1 score of the negative class=" + p_neg + " " + r_neg + " " + f_neg);
            System.out.println("Confusion Matrix");
            System.out.println(TP + "\t" + FN);
            System.out.println(FP + "\t" + TN);
        }


        /** Train the Logistic Regression using Stochastic Gradient Ascent **/
        /** Also compute the log-likelihood of the data in this function **/
        public void train(List<LRInstance> instances) {
            for (int n = 0; n < ITERATIONS; n++) {
                double lik = 0.0; // Stores log-likelihood of the training data for this iteration
                for (int i=0; i < instances.size(); i++) {
                    // TODO: Train the model
                    double[] feats = instances.get(i).x;
                    double pred = this.probPred1(feats);
                    double sum = 0;
                    for (int w = 0; w < weights.length; w++){
                        this.weights[w] += this.rate * feats[w] * (instances.get(i).label - pred) - (this.rate * this.lambda * weights[w]);
                        sum += (weights[w] * feats[w]);
                    }
                    // TODO: Compute the log-likelihood of the data here. Remember to take logs when necessary
                    lik += (instances.get(i).label * sum - Math.log(1 + Math.exp(sum)));
                }
                lik -=(this.lambda/2 *weightsL2Norm() * weightsL2Norm()); 
                System.out.println("iteration: " + n + " lik: " + lik);
            }
        }

        public static class LRInstance {
            public int label; // Label of the instance. Can be 0 or 1
            public double[] x; // The feature vector for the instance

            /** TODO: Constructor for initializing the Instance object **/
            public LRInstance(int label, double[] x) {
                this.label = label;
                this.x = x;
            }
        }

        /** Function to read the input dataset **/
        public static List<LRInstance> readDataSet(String file) throws FileNotFoundException {
            List<LRInstance> dataset = new ArrayList<LRInstance>();
            Scanner scanner = null;
            try {
                scanner = new Scanner(new File(file));

                while(scanner.hasNextLine()) {
                    String line = scanner.nextLine();
                    if (line.startsWith("ju")) { // Ignore the header line
                        continue;
                    }
                    String[] columns = line.replace("\n", "").split(",");

                    // every line in the input file represents an instance-label pair
                    int i = 0;
                    double[] data = new double[columns.length - 1];
                    for (i=0; i < columns.length - 1; i++) {
                        data[i] = Double.valueOf(columns[i]);
                    }
                    int label = Integer.parseInt(columns[i]); // last column is the label
                    LRInstance instance = new LRInstance(label, data); // create the instance
                    dataset.add(instance); // add instance to the corpus
                }
            } finally {
                if (scanner != null)
                    scanner.close();
            }
            return dataset;
        }


        public static void main(String... args) throws FileNotFoundException {
            List<LRInstance> trainInstances = readDataSet("HW4_trainset.csv");
            List<LRInstance> testInstances = readDataSet("HW4_testset.csv");

            // create an instance of the classifier
            int d = trainInstances.get(0).x.length;
            LogisticRegression_withRegularization logistic = new LogisticRegression_withRegularization(d);

            logistic.train(trainInstances);

            System.out.println("Norm of the learned weights = "+logistic.weightsL2Norm());
            System.out.println("Length of the weight vector = "+logistic.weights.length);

            // printing accuracy for different values of lambda
            System.out.println("-----------------Printing train set performance-----------------");
            logistic.printPerformance(trainInstances);

            System.out.println("-----------------Printing test set performance-----------------");
            logistic.printPerformance(testInstances);
        }

    }
