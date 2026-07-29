import GradedRingsModulesAssociativeRingsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GradedRingWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse