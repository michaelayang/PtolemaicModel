#include "PtolemaicOrbit.h"
#include <math.h>
#include <stdlib.h>

PtolemaicOrbit::PtolemaicOrbit(double radius,
                               double theta,
                               double period,
                               PtolemaicOrbit* parent) {
  this->radius = radius;
  this->theta = theta;
  this->period = period;
  this->parent = parent;

  convertPolarToCartesian(radius, theta);

  stepCount = period*theta/(2.0*PI);
}

PtolemaicOrbit& PtolemaicOrbit::operator=(const PtolemaicOrbit& src) {
  radius = src.radius;
  theta = src.theta;
  period = src.period;
  parent = src.parent;

  convertPolarToCartesian(radius, theta);

  stepCount = src.stepCount;

  return *this;
}

PtolemaicOrbit::~PtolemaicOrbit() {
  if (parent != NULL) {
    delete parent;
  }
}

double PtolemaicOrbit::getRadius() {
  return radius;
}

double PtolemaicOrbit::getTheta() {
  return theta;
}

double PtolemaicOrbit::getPeriod() {
  return period;
}

double PtolemaicOrbit::getX() {
  double X = 0.0;
  if (parent != NULL) {
    X = parent->getX();
  }
  return X + cartX;
}

double PtolemaicOrbit::getY() {
  double Y = 0.0;
  if (parent != NULL) {
    Y = parent->getY();
  }
  return Y + cartY;
}

double PtolemaicOrbit::getOverallAngleUpToParent() {
  return parent->getOverallAngle();
}

double PtolemaicOrbit::getOverallAngle() {
  return atan2(getY(), getX());
}

void PtolemaicOrbit::step() {
  theta = ((1.0/period)*(double)stepCount)*2.0*PI;
  convertPolarToCartesian(radius, theta);
  stepCount++;
}

void PtolemaicOrbit::convertPolarToCartesian(double radius, double theta) {
  cartX = radius*cos(theta);
  cartY = radius*sin(theta);
}

void PtolemaicOrbit::convertCartesianToPolar(double x, double y) {
  radius = sqrt(pow(x, 2.0) + pow(y, 2.0));
  theta = atan2(y, x);
}
