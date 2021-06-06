#ifndef PTOLEMAIC_EPICYCLES_ORBIT_H
#define PTOLEMAIC_EPICYCLES_ORBIT_H

#define PI 3.14159265358979323846

class PtolemaicOrbit {
  public:

    //
    // Assume earth is at (0,0).
    // All angles are in radians.
    //

    //
    // An Ptolemaic orbit are actually to be arranged like a doubly-linked list 
    // where the head node is the fundamental orbit and subsequent nodes are 
    // Ptolemaic "harmonics."
    //

    PtolemaicOrbit(double radius, // in meters
                   double theta, // in radians 
                   double period, // in units of earth-days
                   PtolemaicOrbit* parent); // null for "root" orbit

    PtolemaicOrbit& operator=(const PtolemaicOrbit& src);

    ~PtolemaicOrbit();

    double getRadius();
    double getTheta();
    double getPeriod();

    double getX();
    double getY();

    double getOverallAngleUpToParent();
    double getOverallAngle();

    void step();

  private:
    void convertPolarToCartesian(double radius, double theta);
    void convertCartesianToPolar(double x, double y);

    double radius; // meters
    double theta; // offset of child epicycyle center from parent, in radians

    double cartX;
    double cartY;

    double period; // seconds

    PtolemaicOrbit* parent; // null for "root" orbit

    int stepCount;
};

#endif
