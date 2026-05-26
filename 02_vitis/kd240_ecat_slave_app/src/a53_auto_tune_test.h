#ifndef A53_AUTO_TUNE_TEST_H_
#define A53_AUTO_TUNE_TEST_H_

/*
 * Auto Tune test scenario for A53.
 *
 * This file is for bring-up and validation.
 * Later, this can be disabled when Auto Tune is controlled by PC GUI or EtherCAT PDO.
 */
#define A53_AUTOTUNE_TEST_ENABLE    0U

void A53_AutoTuneTestTask(void);

#endif /* A53_AUTO_TUNE_TEST_H_ */