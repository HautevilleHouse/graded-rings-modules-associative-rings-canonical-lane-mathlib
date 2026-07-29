import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsModulesAssociativeRingsCanonicalLaneLean

structure AdmissibleClass where
  object : GradedAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GradedRingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GradedRingsModulesAssociativeRingsCanonicalLaneLean
end HautevilleHouse